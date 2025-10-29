Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19D347BBA
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755635; cv=none; b=iUIAGap441b+70cmqVlv301FzCyuw2ZwRZ41EX0sJYs82AfOMruJ1hhgp6ZiTDVcAuTvPGeHyRGwoLeLLBRqn0DpTtyUUXwfD+GamklhHHDcnnPim2m53LhdlYjEWzE0v22g6P3yML6Gv7mEi33RPSoBLbeVOhOpJIGrqliDWI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755635; c=relaxed/simple;
	bh=T06l1/4GOHE/LpDkePy4eVSTWo0uNva18SmJ0icOHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGt8QQia+zyIh1fqmnn+vFfrtgks7JFsgIQV2JRXJTl3dPptFC/F3PUK87PHfHVdoZKcNfpFCUU/uoZZimeYSu4GhpDfugKo9vfGDYTHYTCQiM7CpXItZKcpOOxQRWQjTiAlQCOVO/MpXBbZLbbvzMlnCMAgAs/tYuw6a8qptyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b93GaOMw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b93GaOMw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b5e19810703so8923666b.2
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755630; x=1762360430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=b93GaOMwfplGCxX8URMZg7Shh+7QpiEJcZ0vUDC0Q8X1C+NflmYESkUbVKIjA9Ej9F
         H56BxkbvwFK4kPGydPeDLF/BiYd1RTVHgLIl85y2+MQSYQRxgF290gk226e0NRPTJtXl
         7DIbcy+QmzKzeJjR93A66ZPnardJjN3TrCGnOo6auGrDPoIlHvyU10qkxam3eIRKyFjo
         YcrOG3rRW4JsUiqtu68s76s+H2jKKdBIanTgSOzE2CE3GFIWgCSktPpquc7sDlRz6jPT
         CfQq/EVQhVp34G4UFt/P8zmr8yqB+Ybth9VT2sM+lcnUS3uRti9R2qtlEiSvjNJiSNQb
         BLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755630; x=1762360430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=DQHM3sLo2ts3R3EZSBPRb5tvDPZgoMj1IR2DVJA4rGjP/KLIV95f51PBaHwc9U7dm5
         wGGskUMMzo2mER+czygj8dW0tdqlKl/ILWilmJi5+2TW3RX3/4r4nmuD42LgzEI3H2jx
         K+ESo04jTuujaB578yeFQl6GeLu7a6/1/GLWkIYW4CbXHBn6PJt4rKyiEMFmym561zca
         lY34ZO9weW6RCDyvmZSNmLBQl2jp7r6/bYtz6di87H7ATS/Uvjnk38XpIN66aOfiUJzE
         8IBvksEuxIBSyiREhdPFPzEOymmlg+gtOM0nMmaS4+IWmggJ/4vw6AZyuRIz9EbWzxYV
         7PJA==
X-Forwarded-Encrypted: i=1; AJvYcCUTPsiSkdjCqWthPXziQ3MF/AVQHJeE7iVqtVc3KulwK3MIUR45A72Ng2m2bxFvKo6Uv4olwiARKUk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpah8LGc4zCvXIcTnvwu6iV1DEbWj/h1Jd+KGRzV4cEc43Q8NV
	WwgPo6Mul5Jasei8vTbU9+tR38aUPkjwb+JyAxwfHGTeqiI5LEZzQ/Xk
X-Gm-Gg: ASbGncuqGBkr6e35oU1y+gnLO/R9OZN3felfNl229YC/LiOZUbEEd+yYvTqnwH6z4B4
	vgbKWEv9LoLOUrFkJ1QXLUubHizYPMcBt+zSlq4Q259Y4qywQrRWAVjPejEDYf+1u3xPUh8FC/D
	xHTUK2OdPGog9QgRR7qPFc3zeU7N3vbmQxfRIMmD632y0D1syTyOT1i/DGRmV2nRjfQviEF3vhe
	evbGPwovmLAHqhgTUSvgesmKpl2T94MymVHgwlh2CaufmDnrRsEeJw42hRth9kyGqUQ4biVhBkA
	18dd0RqsKn61lqigzKclcLkSS8bQy5Yk7vXlpb0HMfwh0HHBArJ6mdomzWicDS9qhjW52cQCq/B
	upgeI3IyCXbyIgbGQ18g6TZ7WatzaO4QYacrh2ZWkUta0rshUnJ70yC61dHR7/h7gj8ytEhHK6g
	PqjThwElK/bI3KcMgm/o/VCiTB7Ta7ubX3DnpCpbtj4eNCwi09/OP2bF6YgAxaWu2SgnfT
X-Google-Smtp-Source: AGHT+IFQlpirQWvqETIaDsilJH4sjQW05iHSTqO+BVFy04krtNR3muOIO8OYFK3MmzGZwCCaLhUORw==
X-Received: by 2002:a17:907:1c8c:b0:b3e:580a:1842 with SMTP id a640c23a62f3a-b703d557003mr393915166b.48.1761755629552;
        Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6dad195456sm939661066b.72.2025.10.29.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 3/7] bus: mvebu-mbus: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:32 +0100
Message-ID: <20251029163336.2785270-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/bus/mvebu-mbus.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..d33c8e42e91c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -1008,7 +1009,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1043,7 @@ static int mvebu_mbus_suspend(void *data)
 
 static void mvebu_mbus_resume(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1074,10 +1075,6 @@ static const struct syscore_ops mvebu_mbus_syscore_ops = {
 	.resume = mvebu_mbus_resume,
 };
 
-static struct syscore mvebu_mbus_syscore = {
-	.ops = &mvebu_mbus_syscore_ops,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1122,7 +1119,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore(&mvebu_mbus_syscore);
+	mbus->syscore.ops = &mvebu_mbus_syscore_ops;
+	mbus->syscore.data = mbus;
+	register_syscore(&mbus->syscore);
 
 	return 0;
 }
-- 
2.51.0

