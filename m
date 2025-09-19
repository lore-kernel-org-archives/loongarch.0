Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C5314B87
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292190; cv=none; b=okKKHUdkAB65jkRshSjyH5Gs7p5nnTUvRHCuL8hr0atvRcqD1w1zlBY5iY2cQmRd8v6m9SJtLf8pIbFhFKHd3EWnsQYCIs9R1jgeVozCIAKzPekXA4cjAKFUKumvP7p/ISzYdCLIeveO+dPzgF7Fi6WXF/FfqHaRWrU7TStdrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292190; c=relaxed/simple;
	bh=81PMYlqM/y1cobIvGWv6NmLT8uHoL246gy0zJP1C1Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2V3eco36rIo20AV9FbP3gITuB0E8kZxJj/Cp+Kb94jcxa1e6TBhCXcgEK0pjjcqe/IJ/+elmaXQSyye3HEQCM1cX8qDj0cpMmChoBmcdM8rESHJ7nOUT2d3e6rAmb3hwEptg//I4ZbXTIX26vu5AJrq0hn4V2PrCuSMKXEsM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BQOMoimQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BQOMoimQ"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 059042054C;
	Fri, 19 Sep 2025 16:29:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBBtd3IQlEy2; Fri, 19 Sep 2025 16:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758292186; bh=81PMYlqM/y1cobIvGWv6NmLT8uHoL246gy0zJP1C1Hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQOMoimQpdAVlc0FjdRCdRXrc9RdGZlN5x5GcNVaZTZroEZ4irVCJF+dvkIeNZ4yd
	 F+YHKnSE3/oSxm5E6USKGj4LaChrpfN4ZVmClHDRtvQYi/lQsUWKdf5zgwvbeXr4Gc
	 r7An77PaG7TYJA8d1JqqQb/0Vi6DwVmSrOrtxAt+hc0KNtSCpnx/OagWgkMuOLfnR6
	 gJ1Q1bgfy1ckEjOzwlIdFrLVUwHNHtNiP+n/aQXZyR95JqDpP1e2ZnLlG6mmzIVkl0
	 J9k+g5S+DFWrc8P6KOteGN6FCPL1La1AHw9S6kbyJyMlS3OwghbVursrksVnp9MHjm
	 d7vEjb8yD3Oyw==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v4 8/8] LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi
Date: Fri, 19 Sep 2025 14:26:49 +0000
Message-ID: <20250919142649.58859-9-ziyao@disroot.org>
In-Reply-To: <20250919142649.58859-1-ziyao@disroot.org>
References: <20250919142649.58859-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property isn't required anymore as the supply clock of UART0 has
been described.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts b/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
index a033c086461f..1bdfff7fae92 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
@@ -40,6 +40,5 @@ linux,cma {
 };
 
 &uart0 {
-	clock-frequency = <100000000>;
 	status = "okay";
 };
-- 
2.50.1

