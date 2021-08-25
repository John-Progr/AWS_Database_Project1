CREATE FUNCTION UpdateTableHost() RETURNS trigger AS $body$
 BEGIN
  IF(TG_OP='INSERT') THEN
  UPDATE Host
  SET listings_count=listings_count+1
  WHERE id=NEW.host_id;
   RETURN NEW;
  ELSIF(TG_OP='DELETE') THEN
  UPDATE Host
  SET listings_count=listings_count-1
  WHERE id=OLD.host_id;
  RETURN OLD;
 END IF;
END;
$body$ LANGUAGE plpgsql;

CREATE TRIGGER UpdateTableHost AFTER INSERT OR DELETE ON Listing
    FOR EACH ROW EXECUTE PROCEDURE UpdateTableHost();
	
	
CREATE FUNCTION UpdateTableListing() RETURNS trigger AS $body$
 BEGIN
  IF(TG_OP='INSERT') THEN
  UPDATE Listing
  SET number_of_reviews=number_of_reviews+1
  WHERE id=NEW.listing_id;
   RETURN NEW;
  ELSIF(TG_OP='DELETE') THEN
  UPDATE Listing
  SET number_of_reviews=number_of_reviews-1
  WHERE id=OLD.listing_id;
  RETURN OLD;
 END IF;
END;
$body$ LANGUAGE plpgsql;

CREATE TRIGGER UpdateTableListing AFTER INSERT OR DELETE ON Review
    FOR EACH ROW EXECUTE PROCEDURE UpdateTableListing();
