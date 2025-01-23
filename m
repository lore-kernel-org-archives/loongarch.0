Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2379920F979
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638910; cv=none; b=ioP5/6PIr4pSHFrGJMGrK9PaCFoo7MiDX4eIerpOv5OHPrNIvLHt49SDRNNG/zWMXcTpmtaf4k2mRJNfKIhntgpLBM1/nDQXXePzbkO749vF4pyOS/w/iOgVP27z0VeJ5UyawG0OC2FQURI8yQoETQ9gHHXzmGWTcUyZc+nuejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638910; c=relaxed/simple;
	bh=FefxEocj4IoJjXKARUpJHCYOj+T2Zg9VgaSRz05BYQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XoLnqLEWHb3zse3WutIlLv6qAP6VhG4cOaaE0HpgSa+DfJylZip/BLyQ9ExIl9rH9dc98ZKcCbTIcJRTFkkifiRWz7JUCoBOU8psRcVA6Xj3Cs1kBMzXOGcvXMoGxGzlR92wkykVj2RXtDGSLD22AAKzxtgkI/MRfmVgbtFAX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SvKdrVA4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SvKdrVA4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21680814d42so14534565ad.2
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 05:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638908; x=1738243708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=SvKdrVA45oNIzIMN/dOVEbIIglDEZc0Bz+2bDYCzLqjPem13u4hQ2PLp6fBoJfeHnP
         UUe2vW71f6phOAPG01IsS0ejV0q/sA6lxuRf1giB/jGtrODZK9Xrz2XGRwA7D1UmszDq
         tD1a/mP++YKya+3Dyo/sWGdqN4Y7rVRDUhHJJvLjtS1jPHeFIJrfs+XXwkQnlYQ2LPsG
         cFPdZGzWW0WvBC5ErcBNkzyoL5u+mxz2XX4GDBQZ1rltAZoaifJu4EhZ7+IOH9fpanxO
         JVDEvkjoE+j+H8he/8Zmt6x42OYpfmmNop2FLTggxYI3Eb6MM/T3IGE2O54feBD/UKrh
         O/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638908; x=1738243708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=cHfDT+FQ83mf/t9nuOF04TDS4s3AX+Q6H5DTcyVeKELwm7P7R63ALQCd4KnBHSfzs6
         afsviIScaMbOBIZFroqni2zS8LI9gIfh23FLZ+EEgOdxOYpV+HO+1ZTXteVAdPsovNPR
         DDlDgKxGU5iqixeqow9TniOo6RC5AmVNGxdV+EpMNWwPGRnBBGyvBgs/ErkTWJRvcWEz
         ADwuW8tpl/3Un2fBrp9oewYw8wHIBmfV7Irzo1HclgNUymnHrIZYDCuqtyvLe61wXVws
         xTEMHLsA74bX8USCqcougUCqm7mRbBoNt+bzJHa5epl5ow8EgtRiALdYjx2ceZFzwP6o
         YAxg==
X-Forwarded-Encrypted: i=1; AJvYcCXCneonEYGbxjHLVA3C0LSqxn1nIKof4qKEMVpffP6wn59j2bk7aAbRWtVkzo0PnZ/gIdMQZBCtG9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV7jedi2vMG2AdDb2P0aSUmG3PdSqoIl/4ptVYudMOXdhWoFdq
	drvy4HtMA8MhRzWsI9DRDK4elCBcU+mmYsZGAY8SOXEaY/lvg9fpZPd8c8ZU/fs=
X-Gm-Gg: ASbGncveTytNnTLDjc9F4TxOtLOE1yngKgz11LOTIW98W+5oNekpxU3yulK39VtKld9
	69MgrvhR7VwXACJmYdi4pPEC+0cUK924i16s3MSKp2YmFutPH085QSlJB/bmZ+A1ogu3wfw/03t
	7rbNCuFOMI01Dg4I3AuOFqXZoGRyrn9cMSusg8cEQO97Ryjyf2NOZ6smTxhl8rKmDM2Sc3D0HHJ
	hNFHZpOpmo8dkl8cydXVVTD5NY9bNNzABwywBEAu+Ti3Jd/hfcFzorl5bHRzWIoY/+fLUHKxY+O
	MVs6oxA+Eph/sYBl46vOjbiWqWB4PYrMbIx/StSLfAt4
X-Google-Smtp-Source: AGHT+IGvH4jPt9gEk2i8wJlEQCGHtq7Z8F/nhrt9cHdxqXKECEeUfNk2qVC/Ig+lLuwaqRjslO9WHQ==
X-Received: by 2002:a17:902:da8d:b0:216:386e:dd8 with SMTP id d9443c01a7336-21c3540cd05mr367659545ad.17.1737638908563;
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 1/5] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Thu, 23 Jan 2025 21:26:14 +0800
Message-Id: <e2a1b07eda16eb84bdc51f6227fec02f2c0a54f7.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
table parameter is actually struct ptdesc * instead of struct page *.

Since struct ptdesc still overlaps with struct page and has not been
separated from it, forcing the table parameter to struct page * will not
cause any problems at this time. But this is definitely incorrect and
needs to be fixed. So just like the generic __tlb_remove_table(), let
generic tlb_remove_table() use struct ptdesc by default when
CONFIG_MMU_GATHER_TABLE_FREE is disabled.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index e402aef79c93e..10cdbe0e7adfe 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -228,10 +228,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
  */
 static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	struct page *page = (struct page *)table;
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(page_ptdesc(page));
-	tlb_remove_page(tlb, page);
+	pagetable_dtor(ptdesc);
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
-- 
2.20.1

