Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778381;
	b=otDF8Wk4TBFKfehNxjmeeDHwpltVwe5kwGtoGZ3UWqAgqBA0UG14/2ik8ZiH+54O2rk/
	 xPo/p2TDBToPwZ/QiB+pNedmK9MP0DDfJ42fuuHx1fJNgfEKonAg0V8v+clkeI1KtwXnk
	 VBM2Ep3GdY3uc0EtxImu37W9tkM/XO7K8zIu3CBMtKudw27Jm7xCgT0QH1anXqwdXtXia
	 euIW1/lw0WlATTZz6Du98NgpLmRWJMRqJlFio+rEQgUPqqzEv2/gYvOBOE/wHv3OYX+xt
	 PUaZxrxbHC6tl2LvYALaZ0rI9r6xE0AEYlW75kvIxBlIzIKrsf/Xby+xS8W0QeNUvqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778381;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=7oS569UmNWNCphbGbEDhGijwxYpSM6/8yQ/ULT8ORQw=;
	b=jyO7prHTQwBVIr1G3UGpFDplXXz1WXSIrraJ/M/l834VFlnK510qRMEb8tzLUts9hXZL
	 CFg1WL8Jfd0/doeBHRnbh4u6ebNlAkAu57P8Qyfjd+A4NMBPcPtA5gRk0IH+jgMfZh+UG
	 sYORliiN5lJth1kwVC8J7OkUF/1HQOA6XwhXZWqpDn6oRgLkag+un7VIOs8a7tcJyoaBq
	 wUnypHNO35+cVgOzgnu88i+KBoFdUuLQzt6KETMZet/GOrK5cnNntyWtu/QzNDODAOp4v
	 VHmHgNGcK3jPu/QNldWo66Tw7hA6iXIvaLv90TCwFEl6zb0X4kONQteUG0n1RWQ37Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39227606D802
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39227606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8CxQNHJ4upq6jocAA--.16816S3;
	Wed, 04 Nov 2026 15:46:17 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxBc294upqZ0YyAA--.10037S4;
	Wed, 04 Nov 2026 15:46:08 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART compatible
Date: Wed,  4 Nov 2026 15:45:46 +0800
Message-ID: <c194b5248184779da500476281fd411fc80a98d6.1793776192.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1793776192.git.zhoubinbin@loongson.cn>
References: <cover.1793776192.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc294upqZ0YyAA--.10037S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGrqon0CzgAAsZ
X-Coremail-Antispam: 1Uk129KBj9xXoW7XrWftFWxJryxuFy3GrWfWFX_yoWDurc_Aa
	4xZw4vqr1fAF1S93yjvr47KryrXa42kFn7C3Wkt3WkZ3yjgrZxGryvk3s8CrWxWr4Uur1r
	urs3CrW09rnxGosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Unlike earlier Loongson UARTs, the Loongson-2K3000 UART does not require
MCR/MSR signal inversion. Add a dedicated compatible so the driver can
distinguish it from the existing Loongson UART variants.

Document `loongson,ls2k3000-uart` with `ns16550a` as fallback.

Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 01abd39509a7..33c13c48ed56 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -196,6 +196,9 @@ properties:
               - loongson,ls2k2000-uart
           - const: loongson,ls2k1500-uart
           - const: ns16550a
+      - items:
+          - const: loongson,ls2k3000-uart
+          - const: ns16550a
       - items:
           - enum:
               - aspeed,ast2600-vuart
-- 
2.52.0

