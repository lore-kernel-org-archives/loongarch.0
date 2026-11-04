Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778372;
	b=gKRyt8Dhe8ay5InO5I6llf0VKUqGk3xy3I708ltlc2wdx/svh8GqXTEHQGxGmANxMtPa
	 i7SYomQJ1ilMYIrIAVh4hPpx9Oz7fd/1XNBqrGrAoRHivfX61Y3EibJwmCo9/YOE9AgtP
	 dosErFRkqAK6+fX37Udax+gmmNMhUZ/dhifDGLdtjFQRpfE6bEc3V7DOlC2V3l1K7lErZ
	 awUe+wRRks/NpQMeNoTocpLud9XYRLN3+wosQfHg65FM/CIhgqEaARex34Dh37I50fxrh
	 y8QxmD8NiUYOG5Dakn6hDffOBb78BiPMIO+m3B5vpZfziJaTdELztTxs7jZAK+K0HEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778372;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=zYdj96Jjn4TYMr6TAGtl+RCu/tlDibSZcE0dt7Llbx8=;
	b=5KBhD30WdeCDu2PqOVmP2T6UYqHd8PwPfdY3Tgepr3VJ4YBISsBObrDrYHzuNOomWuB9
	 KkwVo4jzz5HXBDRtSq/AP8wsgLDvOXcExIHd9333rjkBDCLlZNo2MKBu/BiHs5Ap4IGuc
	 IqeGG4abFY+5Vhmoy9UE7LcjSdh0OHrbgXINC84vVxGVXOj09m7QJWulNP86AWbXwN4bL
	 IhHMzH9oUkFx63abfwvncWL4GnJ0YcBy5jKRY3ucN8+khx7u1FkwV65shZRITV3nEwoIw
	 Ja7K7b7LQtvQ0w2ApTC3tuA6TlrPRCuWpYnepbSJ+xjlZMNVhc8kdqYRqbZXrd/xXLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6A5606A328
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6A5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxD9PA4upq2zocAA--.16369S3;
	Wed, 04 Nov 2026 15:46:08 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxBc294upqZ0YyAA--.10037S3;
	Wed, 04 Nov 2026 15:46:07 +0800 (CST)
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
Subject: [PATCH 1/3] dt-bindings: serial: 8250: Document Loongson-2K0300 UART compatible
Date: Wed,  4 Nov 2026 15:45:45 +0800
Message-ID: <cf76d5d46eaba55b832287d1193111c369bcf548.1793776192.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxBc294upqZ0YyAA--.10037S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGrqon0CygAAsd
X-Coremail-Antispam: 1Uk129KBj9xXoWrKryruw47XF13ArWrKr4xKrX_yoWfurX_A3
	WIv3Wkurs8AF1S93yYvr48Kr4fXr42kFyxCF18A3WkZ34jvrZxGF92ywn8Cr1UGr45ur13
	uan3GryjvwnrGosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7cdbUUUUU

The UART on the Loongson-2K0300 SoC is identical to the Loongson-2K1500
UART. Document the SoC-specific compatible `loongson,ls2k0300-uart`
with fallback to `loongson,ls2k1500-uart` and then `ns16550a`.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 50d5c977afa3..01abd39509a7 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -192,6 +192,7 @@ properties:
               - loongson,ls3a4000-uart
               - loongson,ls3a5000-uart
               - loongson,ls3a6000-uart
+              - loongson,ls2k0300-uart
               - loongson,ls2k2000-uart
           - const: loongson,ls2k1500-uart
           - const: ns16550a
-- 
2.52.0

