Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC27221DAE
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453759; cv=none; b=rsOcicOe4EaQBUSaDy6a13N6c/071aNV6ZrtfVvEnEQaFY50RuY1iR8btZ2KHoAs3wwtj4QUprLBMEqm/6J0W7QtnoK4QzQuPEsnTH7QFm1O1XzDH9/6XGCOe3W3ZvrecW4YmDEHVC+v0DCElJVGrGYq7a2aTd/5Y9CeAUVWfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453759; c=relaxed/simple;
	bh=ofwx4zf3yY/vPpZiXyWfjiOYKTW2xVZryZrU3kAs4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPIXGh69p9+R2d8oNp9QgsDK41RSKKyO6GdpHlOXS3Sv+1LfYXlSxZ8+mA3JbRuujx/AB+euXEWJUKf2ERxZeSU8DQlJSku8SCBkMn1K6NWwU59D3KvCfj/nmRsP9OEADbh1K4B9RduxhzlwKnDRC6BbIWEyAk5cG4/RE0tlir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdLsOWK6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdLsOWK6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso1777709a91.2
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453758; x=1782058558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=VdLsOWK6PEKWAVtP9rfnauUo4dSSXn17ZmIBFStTmyD1+DaihDeylPXM/Mu1E7RYV8
         tzbvKfq2IX5CV1hpJV8sNwzRE/NUcOFLw8hGy8VPYYpkcrjYTv32hZaRtxuu7bzqZU+I
         BogzKdExpXbyEiRztp82O5biVcSJxV9X3lwXeMoYIJd6edp9ZZw68ZYIQN+BWLz+VSFy
         bqmSi5ncmJGtEJhnTOShPuYfI6QYrG4Z3aP65RxEfT1Rk4voIwxnKYS+8ZD2MewCS+sE
         qI9cseAX36pV/+KQUQXSCHJrUl9UbGM6pqoMN/xJ+1SKeA5+IKFjJg5Pta/TjB9JFYnl
         Q21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453758; x=1782058558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=MofilpI4obKV0k2zrgWSS7/B0Se8NtDh1TCLdf40oEumgfnzkuPipRYxQrXHY9JoxF
         wFkhlFhYwlpGw5yQIshuoV92VHnn2ODppk9XjZefvWiL5keMswUn20Jx95q6PxXCHf9r
         zNT8ApZ2EvrcDrYFG+Eqsb/g86SjwA5U6l8N5Ccr3fT5t4kb2J40p9im/dAt/bvM8Ara
         FQXKk/iylYYU88Q9S5lPTaM6Z/0Y33YQoP1E+lp9x5j92KT2xp77sNp7LANxQ+DrsPqg
         BooaC2fpQucp9++APdSxA/SqipFgddAcg1QXyX/byEw6MAqHBenBxQKQrlUCF0cuYrqu
         XB3g==
X-Forwarded-Encrypted: i=1; AFNElJ89BPyl8ctdAPnAbojMs0zQG9oLc9p9abWSDyBeUy1rSCmNBx4uYYs/g73zvCXIxbGbF/dsOEVQrH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEDq2mCktkt5KFfQYyuDAXN1mKmzOsZ3eXkDY8NA/6OVgyo6h3
	M887izYbychZHTesNo0b9Yrg5XNjWIg4o49RxtHWY8Mij4zxfjLqHnpz
X-Gm-Gg: Acq92OHJ5ja5+HfZIp9cLb4QgLmHgA/SPNx+sruEzJ+mskHx6wc7yEbY0QvKgqdtImZ
	gnmmsuUYvNqqjFzdvNekYIv1BnPc819JWTQjAPHO+3gX8LVCMaBa6hcp9L3dHQnxiPbWILEDYZa
	YRxyNfxuYdXa/BfyUxzr4myR65/6qKV3EnkhpUA1j83+cRRBBVi6/Ooa+CGyvG1AY0wshO4UKsv
	aPXvqVXLNgpwDDZsGWiVvFuTfPuAf1yJjvfAkYA3WRk02F8cEmNvlRRy417vK0SKdF5iKOabSEu
	BWvNVZihazwY0qgO61UG7dai9WfZSrEy/nCHWTYMR4rVNKhspeZPjIbJgBF9+qz9frPoPAvoHGO
	5eDhc2oFY87s0OzeyOUUZh9THV9m9ssfw4HIPQ4RFtMp54yKoxU+Ni7kv++sfUAJAsGqw7p04uk
	RKBfrviZRBli5ptkUItA==
X-Received: by 2002:a17:90b:57ee:b0:36a:d51d:42ef with SMTP id 98e67ed59e1d1-37c2bd033b4mr7411267a91.13.1781453758174;
        Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:57 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 3/3] MIPS: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:03 +0900
Message-ID: <20260614161503.2219681-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mips_reserve_vmcore() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Reserve before printing the success message. Check the return value and
warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/mips/kernel/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 1ae6d0c0e1d6..c7769ed882e8 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -437,10 +437,13 @@ static void __init mips_reserve_vmcore(void)
 		}
 	}
 
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for kdump\n");
+		return;
+	}
+
 	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
 		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
-
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
 #endif
 }
 
-- 
2.43.0

