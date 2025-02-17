Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C922253BB
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810250; cv=none; b=fmWVp0iGKaV7rKnHEbRDlex4qar7UsKTf+djOwNA4+JOQXdgtnBPO/mkMufeLShfVjtEIOdhA73fkvpp+LJB56qj0pr6lo/0EKCGK3LWydkjNjkUiGI86QcInve+CnJ2mH/Xb+/kKGZc1wEkMWo2IFxK4Dwl9Sn3jUPSiFNZE94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810250; c=relaxed/simple;
	bh=IanXyIVqTh9J6eeN5W1FxKF9ROn0I3ECBY3aYf1iB4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSXCsuM+mDkD+FBsj/wR7W35gA6qOGUHxMZaRs9HsfDIjPk986I7+6H7ZeePJczzi/2hVms9LdEmAeJtjGNbFrlQa1QZVf/5iaO2zPlC4xBEuFgU6Mv1TQ+ucLt6i4UhIoGRjA0uOWzTL1UdPU/F9AntYvCghdE1lCGSoEUWEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnaXR16M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnaXR16M"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43971025798so11984765e9.1
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810247; x=1740415047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=DnaXR16MeCtbXINuf6tPL6uABAemCAq1yCFfz+ewUk6m9qtyxiKRyZsR0Lb4UJt212
         13JeQvENPvysNdQo1XJ46poKS3Vz/o8pq524aqE/P3yIAV2pi+PhGw1I3+AR3fP1EzCa
         IyVPf0M5kdm5estOoAW2XYqvk0C2zkUavRI+mxGLTJIrqwtQ0ZlpOFHh5lKCBnuULzAV
         DvdxFFIpHWd4cIelEZiyN87ObfKDj+Cna/Q+S8VUwreWMB9XAolJDNbQtSikU6WiHJLU
         sl86gl58UAqocmug22QzPg1RwCT8v+XmskSmbsLZjMOiqQzcW1tPLAPCMaMhi3z9OgvC
         Xevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810247; x=1740415047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=TJm2noqv8YFelfflT2mMLyYlLEfEGucEMgfv0WajDmFumYA1i2WEGYWxLJ0PM9W9Xp
         K4X8AtE+4l5dn5Vw2DFRB6XixJZ+5ogrQhVEcQI37SFgRUoO/6y1AzCCpiThw/dp9yAB
         roFU9sDtsanxJc3QeGwN3zzhZA+t4bVuCmWxM0X1EnnTktoI769cZ2U+uNok8ApwEPt5
         MTpoJwI8kbOaME1bxvTJDhzB8QkaVjZhv98olfUjFQ7cbz5od8dAEcvFd5lZ649S24c7
         BgBwarGJ7jJ6636Fr3HAtLuTzhcMqLAtDFixTtxx+/V5R352LDdrX2rY+lOvJ68aav+f
         30/g==
X-Forwarded-Encrypted: i=1; AJvYcCUCAlKxYZEpQ2xH0En3ucA+JbTKmpdpK7srWoRq5bstSLhLunzW52hwAjiDCk8Wz+OHCR/+K27hceo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/fram9mUtlCqrzh9VPrbaPXAeGl93RWYR+B84H3883j51gZiT
	ZF7Nlf4fUJVqBuXT7odwhbOa1ytZqbMP4zx8b3nrC6BYOme8LSQ9
X-Gm-Gg: ASbGncubsfjnzHs2RrQEWY+q50pbKPXrbccjvy+myZrU+ENnQr+DoPbgwrrYaI7nVbS
	IEJHX2sj/fEgUGWH+0HB3XaDhEiKKJ3GykbjYbvZ1odpgzJTJmdUeNW6KR4Ctkzj7Wh/OP28ePB
	rmy3J3qfhbw4PpaJn9PDf9EaVNlpser1HfsS4gG1DqzBCPnPXZ7WHUMiV7QQUhJ9b0OB3yj4DHQ
	9jhnhFcIkW5++PJv4JPEL2WRuYwdt5Eqpu44P/7K1H/qY+/v+XrXI4Lu206+bnugNtcpCuHz7gg
	rT0lVk8ia2OHEsc4Nf1/bt0N4eSwZSkzVNG4qoLZSF0S502AWYVlHp7qA8MoVd4YK60RaIOeBDz
	WFtoMEto=
X-Google-Smtp-Source: AGHT+IEy54knXhOWSdtV9GyJZiVARzLmEOfX1F7j3ZG37VozHahpHs0vmYGUgUyc0AkFNGY48X3mRg==
X-Received: by 2002:a05:600c:3585:b0:439:5b36:b4e3 with SMTP id 5b1f17b1804b1-4396e6e19abmr89349955e9.12.1739810247218;
        Mon, 17 Feb 2025 08:37:27 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439618a9ab0sm125047905e9.35.2025.02.17.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
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
Subject: [PATCH 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Mon, 17 Feb 2025 17:37:09 +0100
Message-ID: <20250217163713.211949-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
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
2.48.1

