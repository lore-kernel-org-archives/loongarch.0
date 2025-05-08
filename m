Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DF5213E7E
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687773; cv=none; b=poRBItN4e6OOCvLZ7T1vnPX05cWngJhKJ+OygR4XbchhdSU/50h6nzdjgw9uuUFWVfTFdnSA34MklZyjlRskbIOx230snARryN0NZfM9BmG9oJrR7HMqhof1lQ6YVd2qCNB0yAvD+zSHWW5muJNqOKmSQ+aA2y9qosPabiah1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687773; c=relaxed/simple;
	bh=+gwb78Cp7gl7Y1OEcb9BQRdAgzU/g+1ryLbendjWPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJ+N0M3tl2a6Sw90od8bzS9m0sulGm12VgsxgfiN/eAibL73mDcZgJm3rPcjslQTnwxHbsNt/sqlMrfcpNQ9pIhQYYKOtIE6UPbABkbBNSuvXHZ0TOM/5U5L90VR9K4Ap+tLAjSKLgf5dOKeFMZV3076v8CR5HogoUsFsvfzLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8DxWOEXVxxoVGXZAA--.28363S3;
	Thu, 08 May 2025 15:02:48 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBxLscWVxxo6nO8AA--.25269S2;
	Thu, 08 May 2025 15:02:46 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/3] LoongArch: dts: Add PWM controller node support 
Date: Thu,  8 May 2025 15:02:33 +0800
Message-ID: <cover.1746684614.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLscWVxxo6nO8AA--.25269S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7tx6UUUUU


Binbin Zhou (3):
  LoongArch: dts: Add PWM support to Loongson-2K0500
  LoongArch: dts: Add PWM support to Loongson-2K1000
  LoongArch: dts: Add PWM support to Loongson-2K2000

 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 160 ++++++++++++++++++
 .../boot/dts/loongson-2k1000-ref.dts          |  24 +++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  |  42 ++++-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |  60 +++++++
 4 files changed, 285 insertions(+), 1 deletion(-)


base-commit: b56175973e17e67e3005837346ceb79cc282187a
-- 
2.47.1

