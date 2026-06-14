Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406092D6E58
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453749; cv=none; b=FM8h/lWqoZO+3IbD8108agkKYu3O8wT5Qzk6/3p+Wt7ET9UH5HcPiWB2sSSVedIbhHdyioyCTFgA/iKI4c2TeLtFv1X2ioqYXyCA53VKmGgB/SQ9yyz2SHdQF5gXrGsN0DuXDldY67p7HRP/+8IpJ+bzbI3pPBGAhSIilxLXEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453749; c=relaxed/simple;
	bh=f9WmRG917lwuOo8YitFWlgl0yJ3KRNNh9qbjKjNywos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyCuNcFM1mJP2ZXgmvJgktgybL8iQYg+UFc6vy5umx28Gn6BDA2v8zrMnuU/sM6b8Y1iFfoY1Gvx9mlG+Cg2z1RVyvTPscZPq3Rxgsy6cuetgv5Bg6JZfe6Fl8bpN5aqMaIZF9+seVOcKKNNvxkH2oszvyW9Yp/iN8fxnWaOddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7/eyvaP; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7/eyvaP"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so1505832a12.0
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453747; x=1782058547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=Y7/eyvaPA6BCG8sTOYIxdDbIKFOeysO+5GIs1vYBsctdbynIxqPqD0CeK3p2FADTJx
         Y4ndf08n93kqMZuUm+IvJo0+3r7UWDV/JltG06gJaenNyjILiMYCCHDC7YkARt5ZQpYS
         tph9090DBe0QU7JM3EKEX27o7U5j/4bVy474Plc/vLRWQxpbcVWtXQvPmHl+NmPikYLc
         e2qPFi4TBDSZHlwn5BH4gIv8kTsT01vOJwjBJiAlODqnL3Xl8g3Qs1l0rrK3zyWmWkL8
         3B73fVEkoLgYQVwHI/klu+xluPiDK6I+xot7P+cts+LdDfRCVxa6QHMEINBXtcEeACFW
         BfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453747; x=1782058547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=BMxx54J55j6fKtO+Qh0HhE0k0U1hy2WYqnSZuKYNCvCYGvCYSAzxs4/jor+CU4MutZ
         OoQgpyMcC2YyQ4eyij3cCLpWCjdI5FpZUEZaysP0JVWB5wPc7xJR7cKzfKYCFUTtMn7g
         VzzwYIfTVgBOl3ksTZddN10lRflGL2X/75Yolh3qeXK3h2q5agdhPlwf3yTFEQAQR2Ls
         6j5fz7e23UVpzNybGB0RqqO2M4fjJ3ZYWqTm6WjtiHWy4rYNKI+uArz9p9dfaMsWr6pX
         xsnYv0tE4zT8aI0FVcyRS3/GLaTGwVXojAH49I6UYCEwRY/AQSpV6I/2yo1y9nYqnew8
         ifJQ==
X-Forwarded-Encrypted: i=1; AFNElJ93cXpkaell4YISjQIrajhDEaolnC96FhW6dTixx3QXe9jA1ExGWo8t4hhvOAf7OqofxypEyEhDuZE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtyvRQ4wdj9enQxQb8M1ZRNHVcwhBHnYqHcTR4u1nKYdn0Gbgm
	sT6mBP72hhN0nBy0plKy5lGzFR6AgFft+4G/cAv4531c1fOhRfp1EzMJ
X-Gm-Gg: Acq92OEUOsGArmxT8KGokTHu8TOUblU1iih9A3hPJjcTeY2y80n4AJv8RjSKkry/8t2
	Vx7upBqVdJRpSI7aPACrEUsES3NxDvmYKYGN5SmKbKxSV7j8KxItU/mWGNlY3/r4Ou8mS6+eLPR
	j2r8SOZrQwtM/R8yAGmkju2KLtadUzfbZm+SR5JHC6luJts+lqhxdoGvUR9BLn70JX0TC1+RbSy
	LZFxA7ACvS5QmR/Gkq/46AjKn77dwksNfIoVngNGDOqxF274sRCXgmqm0h6sWOHy+G5ndhh4qMW
	HXrJ2BmmtmHikheH0BtjVM5bCoHEZYLw6+FPA3oGTwbCBw8B+NVyDByWUEY8QBd7k/D7dBjwkSl
	h3zh+FDz1RSQJK2w3xo9VCnHTnK4P4Jm9t5b0vUBh15JKqUaFVtqJZpR/ojTyvWG1cRsF/WIUvw
	jbAS8iesr7rTsvfDkEK+lye3IqSsJJ
X-Received: by 2002:a05:6a21:3115:b0:39b:9644:6e94 with SMTP id adf61e73a8af0-3b783c76cf4mr13112661637.9.1781453747617;
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
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
Subject: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:01 +0900
Message-ID: <20260614161503.2219681-2-ekffu200098@gmail.com>
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

fdt_reserve_elfcorehdr() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Check the return value and warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..d985c07d7c5c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
 		return;
 	}
 
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for elfcorehdr\n");
+		return;
+	}
 
 	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
-- 
2.43.0

