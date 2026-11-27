Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762445;
	b=in5d30yWi9LtaE8aQg+9nQjIwHyyIaM38/StFmiy6QbuoRfV+fTfZJhTLIJTBJQoYb9P
	 e1uq4zVJ7/vgA0zAhV80GbS7I18NwyBSHb1GgBtvM01ufJDs1UtHHWpXKHM+m1IH08Hb7
	 1w8yIURTCLzXSEj1ZTncWCk4KFPlUXRpGkCJDTm5wKiJLE6RcjNUByvhUN1MvoEYuO5wj
	 Fln44jMFO3rZzHhlBb38H5er/KMubfu0/Sy7MNbc8x76Y7t0+hyrOAoNC3ifd0Qu1qS1T
	 8oHlzzfE3WI66tCRgXNdfPMPwwfSXFDOTEwQiHaenvtG0+b6ScYxRibe6zvhsLLgh6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762445;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=etMIRKpPRyg5p1f5SSu1Q7sUXYF1xtuvPyJAFBd6Q5g=;
	b=VXPJMQpo3iT0ZgpaNSPVcNrHe/uFO5igth09SWPyn2kQ16YPxHO3joRcJOz9s7H8yXhr
	 kyrEdm9AD4Vaw8d02YcoMQxd5ktezhXy2nAbPjz7phvJv/bi9jnQU6fo9PpQDavimyHDA
	 DMTcT4wi2R/AEuRM+I7l8ZG8c8pIkJ0liWq7Ho+2FhBGGJr1OHsMd9SAmw8MrCthW/TjA
	 t1u2LgsORG5bu2h9FehNxiHJSaMriKj+jvda/tj5uxLi20LYLHCfNwIYB1NWTSTFvMmjC
	 8WBLhpW+sZu9i5khDnX99+V/uATAoWuZska7G3jcKxoSs1BPIUmpO7wYFoMXRFiK3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65323606A31E
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 06:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65323606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxVrUGKQlrp3ojAA--.7016S3;
	Fri, 27 Nov 2026 14:53:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJAxFs3_KAlrXbc3AA--.52846S3;
	Fri, 27 Nov 2026 14:53:55 +0800 (CST)
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
Subject: [PATCH v2 1/2] dt-bindings: serial: 8250: Document Loongson-2K3000 UART compatible
Date: Fri, 27 Nov 2026 14:53:42 +0800
Message-ID: <c429fd68b6c08e3bf4f9af2bbed40c699cf205a9.1795761142.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1795761142.git.zhoubinbin@loongson.cn>
References: <cover.1795761142.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxFs3_KAlrXbc3AA--.52846S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEECGsI5P0GEwAAsj
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrW5Jw4xur45XrWUWFW5twc_yoWDGFb_Za
	4Ivw1kurs3AF1F93yYvr4xtr1fXw12kF4kC3Wkt3WkZ3yj9rZ8GFyvk3s8Cr4xWrWDur15
	urs7GrWI9rsrGosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UUUUU==

The Loongson-2K3000 UART does not require MCR/MSR signal inversion,
unlike earlier Loongson UARTs. Add a dedicated compatible so the driver
can distinguish it from the existing Loongson UART variants.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 50d5c977afa3..166cb7995b09 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -137,6 +137,7 @@ properties:
               - ti,da830-uart
               - loongson,ls2k0500-uart
               - loongson,ls2k1500-uart
+              - loongson,ls2k3000-uart
           - const: ns16550a
       - items:
           - enum:
-- 
2.52.0

