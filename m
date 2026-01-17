Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C4A2DB790
	for <loongarch@lists.linux.dev>; Sat, 17 Jan 2026 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616842; cv=none; b=pT/Ff6zUoRoBixml+6VTOw7tTzsMPQEH0lqa3DT5qqN/jIWdO4WkmTp9zhZeNsVvM7yrRzhoL5aFeLezMVG6/Vrq3Y1Sn4wrY+Z/KgB5dvYxjlcWsaTwfAlmRJeobmJG2W6IwItefM6rkvwTDVpf3rVgL79hFxMN/JfjIAYDV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616842; c=relaxed/simple;
	bh=m/utFi0BLeB3LVND3/ezPIBfaGLGy8uoDxdmB4a+gz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5f4mFXpCKkYeL3RPo4f74Qm1IA/oLwLGDztf3mtBw1otXjJEqn1vvv52+fO5AjDptBr0CshF7OCM6tn7ISX4u2UEEHYuRy91/v6t2nSLOPnERZxqFUb0c+aJwcOoCdsVqNo6Pfp/zmlpIKZs2iDXwS9KSCoBIB64OAo8Qa8sJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8CxMvF982pp2McJAA--.32328S3;
	Sat, 17 Jan 2026 10:27:09 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxTMJ082ppbNkgAA--.65061S4;
	Sat, 17 Jan 2026 10:27:09 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 2/3] dt-bindings: rtc: loongson: Document Loongson-2K0300 compatible
Date: Sat, 17 Jan 2026 10:26:49 +0800
Message-ID: <0c6a4fd221b5bf05f06cae9bb543a5bf7ea59f57.1768616276.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768616276.git.zhoubinbin@loongson.cn>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMJ082ppbNkgAA--.65061S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGlp0xwWVwAAsP
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry5tr13uFWfGryUKw43twc_yoWDtFc_Ka
	4Iy3W8Gws8AF1ag34jvr4xGr13Z34Iy3WDC3ZrtF1Fy34jv3y5JFykAw1akFy7urW3ur1r
	Zw4kGry8Zrn7GosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
interface of the Loongson-2K0300 chip.

Its hardware design is similar to that of the Loongson-1B, but it does
not support the alarm feature.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/rtc/loongson,rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
index fac90a18153e..aac91c79ffdb 100644
--- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
@@ -23,6 +23,7 @@ properties:
           - loongson,ls1b-rtc
           - loongson,ls1c-rtc
           - loongson,ls7a-rtc
+          - loongson,ls2k0300-rtc
           - loongson,ls2k1000-rtc
       - items:
           - enum:
@@ -48,6 +49,7 @@ if:
       contains:
         enum:
           - loongson,ls1c-rtc
+          - loongson,ls2k0300-rtc
 
 then:
   properties:
-- 
2.47.3

