Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366429AB02
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748377; cv=none; b=Orem/tLNGSENXVXLSBUVgtT/gXSlSDPvbzTh/yIJVLxOcmhjSivWsF0kYVh5/LC2ap7cI0wHxOBKlE0og/bGHGjjtLTzZNdi7QFXOiT4QPkKKgI0YQUFFXHCrJf84WFRfenOloc5tMjkE7Hi4E3m+QOSmBrg3HEksvs30t+2ZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748377; c=relaxed/simple;
	bh=Ngdxmfsw7khuHkpFPEaaMiq7KTg8BovR3y92Uhy13MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPbL0pEZzAnsc2RdiKMWOBfO0TcTV0T0DYkS5CZIOPr+mfJZRuf8l49qDp0fcu8j5Z54H20CqmI+d62m99Eb2lkQhQaRla4QvqvjV5P1h//3kNLCYj304k6n0v93K+NApKLEU9RezE8hjaOrO3LDgE67rFz1eC0kmZqI+LhPxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnI9DCEL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnI9DCEL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so604984f8f.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748375; x=1753353175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=UnI9DCEL5t53qClqN3NpjfG7y05AsYxhAzqYJxSj+TBIaYofA4j0K4rQx3ow4Qky3z
         xmu9n6w8swao783entz/mG1T2BsfgHCb5wuh/8o1lGu5hoexg7WOXBcyFNWRnVs3rwJH
         oVOpBxKEw+US3xKz3U4qyYLFHTZn4a9VH4z8eneN5d+9XFp0umdRfMu5XyNcN+lwNGSj
         /aqTkEv/yFVhMJMvmCK0PuvA2H1pY8WUGrIRh0QVhkleBCEJ6CHpAZ1QAmMR5DYxIUIp
         p/QVKfIUiJFb+DxcB2UCNjX1Fi7r8QdJfUdljZ9YmHVq7EIyXGnp+6fqHlhxcPWOwEF/
         bM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748375; x=1753353175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=aSJMLc7DcXamy48PRTSeaiIlPkBtWi1eFSpgFq9VUtBm7/LVF9xF6GwCsL6pJpUPKE
         Fat/5IBVS2ty4KWoUvqYlSnP0dK+NH10J+giqBjAJJbYDF/w5GYmsGUqBEKr0xzCYYx2
         n149CTCO2craFcQP6Wd0NmTwIax4rCXj4oyrgudIoFGZ3SblyK4Gf9uPAeQe0nhqn04A
         KGYEMIzu3Ui4e06EiHrGmk1ibOtj0+roeBnvPVtSKAWIaH/SySTb+7/urDvzWAK/aSgH
         IOgg4aQQw6B7r3tPNFG0hruyfSUollUl4KKDNmVja4/E0yp7k9xOqoQmmDgSt1vBtyq7
         6+UA==
X-Forwarded-Encrypted: i=1; AJvYcCVmMKUxSCN1ZuQjTrhYcq3ewIpEeWCgYxmj1PLGTU9r/m2ItF5uOt7lh509VQS9+VoZUwgu6nK6lvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNKmoCL8lwArYxmrpaKYD3oDz/jsI/mLgCn4PEBVS/CLFoKTUT
	dUZnmEk3idNO3NkJwHaJ6V1A46sDQ5hECX1+Mp9KtyijpCOMYxtCftvt
X-Gm-Gg: ASbGncvkDs9Veci0qgfT2sFGIWW82QuyG11AkadaNqEgc/oyK+Q9iLRpCZDU3ZEjG5x
	H2aixDmAEHYthFWlVze7Ba3QkJh+uZ5c/xVtSsxvfZebCnup7NEMdaaqAGezHdFfG1Vwbz+sTEK
	/cXmOTdHdxRTt7lVtpQZmHd+3KO80N83QpZb7chB+KixxnMNx5pxh+nqofNJ7RERLCqRDyPCo++
	orJQzdyUefgyZ8Elm01bGJzF2C/L+ip+WLLaLUbiv+p9Cgi/VzZqMd85b9peZAxXYJTTzuIqI/u
	s7NWib3FvhPmziPdPDZ2uZuMjIXfl+rgr02YixyGSg6RehppjzBFpLsTYx2CsjFKxl6AMl0FKfI
	l4TUE57IlRSggpgu5y53zPIW/m1+fUJ7D4b2qYcYCowrPAN22c06DPueOw1Hg/JvSah9eNBQkrz
	uNX2H0lIAobAkRzA==
X-Google-Smtp-Source: AGHT+IFzelVEVcHZ/OEffn+B3ZOPH1G6XXdnoiZLhN8P1cfO9z6/oEzmEO+w51ye1sA65QFg9m/KUA==
X-Received: by 2002:a05:6000:2d84:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3b60dd7d98emr3809652f8f.46.1752748374338;
        Thu, 17 Jul 2025 03:32:54 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd163csm20204660f8f.4.2025.07.17.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Thu, 17 Jul 2025 12:32:37 +0200
Message-ID: <20250717103241.2806798-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the mbus context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/mvebu-mbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 92daa45cc844..1f22bff0773c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore_ops syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -148,6 +149,12 @@ struct mvebu_mbus_state {
 	struct mvebu_mbus_win_data wins[MBUS_WINS_MAX];
 };
 
+static inline struct mvebu_mbus_state *
+syscore_to_mbus(struct syscore_ops *ops)
+{
+	return container_of(ops, struct mvebu_mbus_state, syscore);
+}
+
 static struct mvebu_mbus_state mbus_state;
 
 /*
@@ -1008,7 +1015,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1049,7 @@ static int mvebu_mbus_suspend(struct syscore_ops *ops)
 
 static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1069,11 +1076,6 @@ static void mvebu_mbus_resume(struct syscore_ops *ops)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1118,7 +1120,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	mbus->syscore.suspend = mvebu_mbus_suspend;
+	mbus->syscore.resume = mvebu_mbus_resume;
+	register_syscore_ops(&mbus->syscore);
 
 	return 0;
 }
-- 
2.50.0

