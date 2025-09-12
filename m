Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83732D29AC
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663213; cv=none; b=eLmdfRDwV5SfFOchEjzH8jD2jQk9dFdMhqy/GuRJAUev1C/Y3T2mnriz3YsqxGxiPiQcx/NlYcqUy+nMncqAgwN0E8IymlK4fL+hJIE3eoTcj7yowD7iilFunzeTMBmMoz5SfSlrlyI1CYEcOOGMvk8YMQAWtEZ5uS7jyItbeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663213; c=relaxed/simple;
	bh=9yoMY6f/O5Kdo0NFe6sZTx5s/b+R/IevS2MD/nCV13s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=HuJ37gHaW2O3ST+yi+Y6VfsKpZFxVZysPOJrQAbXVgBLo6BBcO2XO9Ga0QWPK2VUyv8A9Fxg0xy9YQROgg2WeDAY3JECq0SNoWSJwOfL8YW/mRz+u+WYaSCYDBN1XXsOIBH6eV3md9BxYR3U89utloo3HGUQpNVMmhzvbljOMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQJoAluP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQJoAluP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757663210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vvaALMZ4+zN7uBMG4oemyZs/dyL2tuTURio8S2qM/9A=;
	b=FQJoAluP/EErJixpMdoB8vTjpyyyoBnAm33R6+A66/sDieKsIdTtmUh9EWYqa6oFm2ZlhG
	wDmGz+Mrdk7ILEqfh3Od/KqwDEjCVhMguDDG28WdTZxYY38QuRIfRH3RK9El31WeWSi26X
	P9XajOzAcBfcA7oBytPejaynb6ujC18=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-RNXRhwBMP7G_ZudGmVsPjQ-1; Fri, 12 Sep 2025 03:46:49 -0400
X-MC-Unique: RNXRhwBMP7G_ZudGmVsPjQ-1
X-Mimecast-MFC-AGG-ID: RNXRhwBMP7G_ZudGmVsPjQ_1757663208
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e761fb1640so1256478f8f.0
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663208; x=1758268008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvaALMZ4+zN7uBMG4oemyZs/dyL2tuTURio8S2qM/9A=;
        b=EAx4ntPfw5xFer26BXX7O0pDW+2JYrRi8SiITChs5bORB4BXct5qmVsHgbUzRRCRWR
         B5Tb1fgNJRJ5/1mTyvutuIA/GzN6FEE1NKrVHyqaRBiNMEPxitnFPo/QhqWP32bKogAs
         K6XvRsyriUc+590XeYjAS1HIXzwDbky9mTal4xrxkkb+9xG67JNoBaARqtf4QLNudZDT
         bK9+TYf5BK9tUQUK3BlN2L9r5dM/X6HhUkpHbVfKTBKlIAFznlCcSYop6rJbS9B1o5N0
         UKsSHJvwWrpVFGI+/uO/jko1hKejCbz/MlEn4TQQFFfUCSsvp0tx1lACqTRMe2MtlrTp
         saSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEKPEgUp5Wk4Bk9pEJgruXHv2s3rG67l7qxxtcMv9nTKr8TX5C+RAgE0lzLszSoEWiK3t1Q2ZD/Hk=@lists.linux.dev
X-Gm-Message-State: AOJu0YznXIp6FU400n8cpS12T8VUbwlIQpezWor6wBBcEgpVKj2bWjXl
	GN7Qpi7bwJjTk9LuqSePb3+//ouOr4KuK59QcGk400kXMiEoO0lR5NSW5PyOyl48mDUHV3tIb3r
	5m7QHAk29oh27Tyt2aRkwfjFfEfJ0xSjLuB4gyiiojfAkuL/grtM1/0o4bMMtJA==
X-Gm-Gg: ASbGnculld7h7/BB43O4QZifKiM8BEVzcSSe3obctFaNEluJB5y1RwFubsVdX9bcT5F
	9GCAwMYcklTGV55Qxi6j1Yl7QlCsDKg5xQXcGK3qjZo+xbOHigyh/79JrmKFj679NE+8m85d7+v
	wrvt076DM+4jR0j5vXD9j4QncaiohFNz1wj9EAzXNFNkGDzam7LbMG5QKj7zcXO/30bIx6pgZip
	ro1N1kmg07syuguzcHSxVoM41gPlFASUhJtaFcS1OeIfD+HJGyeTHKTcXAMBGgQtiBJwvEzoDgN
	WIumH4Dm4PZbOirI+1SUuIn9HF8pV4F+gXxtY8KV/j8flF3UF0DiAIEvQOvEcRMYpBwU/K2tZI8
	1+jdQEKhTuHlFzg==
X-Received: by 2002:a05:6000:2891:b0:3e7:620e:529e with SMTP id ffacd0b85a97d-3e7659ecaa7mr2028794f8f.43.1757663208171;
        Fri, 12 Sep 2025 00:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm21ubE8d+dHPSjquWE3BgW1E1TkX8hsLoEa0HPJgLnT8FY+Bw9Zzo9lF6e6QuFVRZXGNdUA==
X-Received: by 2002:a05:6000:2891:b0:3e7:620e:529e with SMTP id ffacd0b85a97d-3e7659ecaa7mr2028771f8f.43.1757663207787;
        Fri, 12 Sep 2025 00:46:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm5362628f8f.36.2025.09.12.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:46:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-crypto@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in LOONGSON SECURITY ENGINE DRIVERS
Date: Fri, 12 Sep 2025 09:46:38 +0200
Message-ID: <20250912074638.109070-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uOvjk2kVgHSqeVSbJKdxoex8r2xNm30QAXgZOR4JN-Y_1757663208
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5c83b07df9c5 ("tpm: Add a driver for Loongson TPM device") adds a
driver at drivers/char/tpm/tpm_loongson.c, and commit 74fddd5fbab8
("MAINTAINERS: Add entry for Loongson Security Engine drivers") adds a new
section LOONGSON SECURITY ENGINE DRIVERS intending to refer to that driver.
It however adds the entry drivers/char/tpm_loongson.c; note that it misses
the tpm subdirectory.

Adjust the entry to refer to the intended file.

Fixes: 74fddd5fbab8 ("MAINTAINERS: Add entry for Loongson Security Engine drivers")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa7f80bd7b2f..a1339a8bb705 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14537,7 +14537,7 @@ LOONGSON SECURITY ENGINE DRIVERS
 M:	Qunqin Zhao <zhaoqunqin@loongson.cn>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
-F:	drivers/char/tpm_loongson.c
+F:	drivers/char/tpm/tpm_loongson.c
 F:	drivers/crypto/loongson/
 F:	drivers/mfd/loongson-se.c
 F:	include/linux/mfd/loongson-se.h
-- 
2.51.0

