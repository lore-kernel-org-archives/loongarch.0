Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA51DC988
	for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 03:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755315267; cv=none; b=qkHZKcLz8NU6jYX8X1TUFtIMzoifObHL720UK4yCDe3SEm5bxTpMtG2SJgZYGqCvwUDGMGQDuRIvE8rA6WLWybfcMj6tJo/mVGaB0Jr9iiMQ+R0GDGhe/5VWEonpdD7Hn3qR4uQ91404+fmoaAqugrlEFss9HM793asdOeHpK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755315267; c=relaxed/simple;
	bh=3Onuxn695AX2zEBK95rdI5lJFfzKyi0Gig3enS3hQmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWpMyg//7+4E99I1+H4/p/Q52CGbXExtJOsQml0km0ubJ0pxCGtOgoydS4ujTqsQvZYxN0rUpUq/gKBHHTIY5qpKqrpIVNOBrc71a1KpLeoBpY6N56ntKAB+iaTC44+cJ8jDTJWO17pxcndHJCYDQ/gvX5JkX1e8SRqRmfCk5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R+NVgeiq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R+NVgeiq"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A83CC25E88;
	Sat, 16 Aug 2025 05:34:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afTrq7HLdU_U; Sat, 16 Aug 2025 05:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755315264; bh=3Onuxn695AX2zEBK95rdI5lJFfzKyi0Gig3enS3hQmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R+NVgeiqRnyYkWKR6/RQcRcFhSfpkrqtDSns2taOmndMB1ppMr9rLIzCsxOcOInVG
	 Wb3zSGxmxaxRBpjD4tWPaKli0kp6GV1Y9JLlPDQNjIYWvXS8tWLnCpTK8wNJuG682H
	 6sLDMQht/ykZekRtQaizA8H/vkbYdjf52sgHxX8n5OlNpxXKkaiQ41O8sUjWDyeAhN
	 JhlJn03PqaEggyymzz36JZvVBnWNRG6WZtDwdH1RBW9IjOwz+i21WXrDNrnG3XEsP/
	 8IjYknczapdvyOaDGa6/vquc29ar8lWsYAYEmxKgngXpEy0QXk4eKm83mORZuphjGm
	 KsL4Gms4VF+FA==
From: Yao Zi <ziyao@disroot.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/3] reset: simple: Support Loongson 2K0300 SoC
Date: Sat, 16 Aug 2025 03:33:27 +0000
Message-ID: <20250816033327.11359-4-ziyao@disroot.org>
In-Reply-To: <20250816033327.11359-2-ziyao@disroot.org>
References: <20250816033327.11359-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller has contiguous distinct control bits for each reset
signal, where setting to low represents reset assertion. Add support for
it through the reset-simple driver.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 79e94ecfe4f5..03a19d4505e6 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -155,6 +155,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "loongson,ls2k0300-reset",
+		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
 };
 
-- 
2.50.1

