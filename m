Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AFB146A8E
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313257; cv=none; b=oTBkc6xn0Ly3S2rX1sfP4bTgEzyLyhaqz0JGzPajx9XZs8z97NWvH08eMmQTcsasF7tC2H5APpD4IiwE7x3bSTtOkca1r0JSwsSTqkUwSjQ15ttDd8iwrUMrl5RqRyR02XIXVl/Duy8mDGXHFbp5PTYFK67rpqG6uxbiMMM0xZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313257; c=relaxed/simple;
	bh=0vIHAQ7YvjnLKfwQTv8MsCHk2eaPF3/En/Mr81Z6QRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoOILcBu6BAvvp8XxWy3NYBXtNTzAKV/q/fD4aBP1DTWPwFcMW1SBrfOqRuIxodyQqgTNM8zQVh/Xv3KgIde3n/n6SmsiJL3mZgOSaiVwijJTKzyxyXYfA2Z0xFTZfpCEGpoM+Pu8vK/pjan4GkZfK51z934e2sBxTEGiU/SV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A//uzzfv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A//uzzfv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce674da85so2102728e87.2
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719313254; x=1719918054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTaK8ifaWbHOYZsMnepqrh6GgtvKb4cednFDr4sSDjo=;
        b=A//uzzfvcCGCrGCF4UyiZiFAp0TR7ea/FLxmiHqHeNqcTDCbV42Qt6mzImhix96RYC
         tgbvNzEPOlykR7JS/O2z1sy49t/0cWtVF/ryR+G0bunKO7VyqfH6OYIxQ/75HWA5M2e0
         QSj0hTL4usBwE1MgysMV1acNj+fysGXbgpW1adaA2vhUcaJoe+9cI0LgmCmK2tW0Eqzv
         kCIq3Aije2JmFcY9ivzjpn9rGCl/fYdSEBnqG4WWRQNU5ncXX5PHt+OrIBlZYG2Q0h1I
         jdCbjuEtoBI8j9u09zeR+qg0XOi6U9/U55fSgXDzwJzkrqLPDh/by8xG4TSZkD6uY1qy
         WwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313254; x=1719918054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTaK8ifaWbHOYZsMnepqrh6GgtvKb4cednFDr4sSDjo=;
        b=dyh9hEEiUlVUwQrnfQzDuw9UAoopKfGs3jO+ljInO4WdjPH5LMeYMZo/L+qKkCeSyu
         pafGdnuN8eHUMsAQYl9SsxdPQ/IprsJs5m/31R+gCp8LLbhIZjXr4D7HF1oml/PRshDu
         TE/48KPnlqIHGrHogxZbmKX04lhNp3JhzKUt1S4G4CxivodDr8loKjI8wdprsoLWQYaP
         EwTx9ONJSZCYF+8wB+fOUq6VOXvhfJ5IWhx4NHozoY6xRZihlUImdg/XLum1ioOBgfJY
         mAmTB+PWRi4ipHPh3H7oqjHCrTIu9E57toZMRZ81Ca77aYPJA8ZUQHDw/xtU7FzHCIYm
         AoyA==
X-Forwarded-Encrypted: i=1; AJvYcCUQPjQKA+aJVuCTNdCJWFpPcwAXayZh2KrhoPaNE31/mTKxls1B0m1tnVf82UcX9xbzdExwkjIg9CXFgFrjGh9ayN16p9+5ieUA
X-Gm-Message-State: AOJu0YwtERAWj/nE4xAmdXklc1/D/vdch1danJe3+9SH2NnGcZbVnbre
	OyKmKkKAMMlFnf0/KFC62uYym2SqkFkjYGdXRGSgBvO+XFwoP+Df
X-Google-Smtp-Source: AGHT+IHpV9HXs0P4QbXTCeQhNYlDDBqrB2zbBl6B1KNa8va0iJtWcu6ToloiWeqSJ7giQ1iNQeXX6g==
X-Received: by 2002:a05:6512:3703:b0:52c:e4bf:d55d with SMTP id 2adb3069b0e04-52ce4bfd59fmr4509583e87.8.1719313254090;
        Tue, 25 Jun 2024 04:00:54 -0700 (PDT)
Received: from f.. (cst-prg-81-171.cust.vodafone.cz. [46.135.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724162f037sm337272566b.194.2024.06.25.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:00:53 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	axboe@kernel.dk,
	torvalds@linux-foundation.org,
	xry111@xry111.site,
	loongarch@lists.linux.dev,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 1/2] vfs: add CLASS fd_raw
Date: Tue, 25 Jun 2024 13:00:27 +0200
Message-ID: <20240625110029.606032-2-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625110029.606032-1-mjguzik@gmail.com>
References: <20240625110029.606032-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 include/linux/file.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/file.h b/include/linux/file.h
index 169692cb1906..45d0f4800abd 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -84,6 +84,7 @@ static inline void fdput_pos(struct fd f)
 }
 
 DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
+DEFINE_CLASS(fd_raw, struct fd, fdput(_T), fdget_raw(fd), int fd)
 
 extern int f_dupfd(unsigned int from, struct file *file, unsigned flags);
 extern int replace_fd(unsigned fd, struct file *file, unsigned flags);
-- 
2.43.0

