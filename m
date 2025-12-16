Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B642C31AF1E
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 07:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765871718; cv=none; b=sz84n+3XK4yoChOSKub29z5Kd/PG0YXlCyru+DsZYkTOG9ri07w6ByIY9Zns23jbQxjs471j436eNmRpuyglY9om1JmBTh2DKP1MJ3fI/rA0hTbmXDUUhpeET2Iq7bH8ekbn4RRkiAQUE9JBItRRM8vPZcfNH6ihJYvcM1Guqpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765871718; c=relaxed/simple;
	bh=f7i2qAKSCSIB7okyd9lr9s5zvYMow8SSxXU/h6CD9aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M46ufnh1HO9aVQcrc+cEUqoWCFqxV0JfLxk7/nPoa2vcD3IdohxXt5BI7ruFvjhQx5EBQ2y+Z7DMx68BG0CmNQ4+aNn6K7e1jO6FSR25YSDgcpKlWvZmkPxfF5VYcJ6m/ChGnA5xc1563CpRNHYY47IWYi982/JgjfjoIgB7TZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.219])
	by gateway (Coremail) with SMTP id _____8Axz79fEEFp15cuAA--.32787S3;
	Tue, 16 Dec 2025 15:55:11 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.219])
	by front1 (Coremail) with SMTP id qMiowJDxzsJZEEFpT2EAAA--.1958S2;
	Tue, 16 Dec 2025 15:55:06 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 1/7] dt-bindings: PCI: loongson: Document msi-parent property
Date: Tue, 16 Dec 2025 15:54:56 +0800
Message-ID: <362c474df2ba42d22f12197c58525037dff7d71c.1765778124.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765778124.git.zhoubinbin@loongson.cn>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsJZEEFpT2EAAA--.1958S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGlA9JgB4gAAs-
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFWkGr48Wry3XF45XF4DWrX_yoWkWwcEvF
	yxCFs5Crs8JFy2qwn0vr4xAFy3Za4Ik3Z8Ca18JFnYy3WSvrW3KF97J3s8ZF17Gr45ur15
	urs7GrWkZrn7GosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8wNVDUUUUU==

From: Yao Zi <me@ziyao.cc>

Loongson PCI controllers found in LS2K1000/2000 SoCs
(loongson,ls2k-pci), 7A1000/2000 bridge chips (loongson,ls7a-pci), and
RS780E bridge chips (loongson,rs780e-pci) all have their paired MSI
controllers.

Though only the one in LS2K2000 SoC is described in devicetree, we
should document the property for all variants. For the same reason, it
isn't marked as required for now.

Fixes: 83e757ecfd5d ("dt-bindings: Document Loongson PCI Host Controller")
Signed-off-by: Yao Zi <me@ziyao.cc>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/loongson.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index e5bba63aa947..26e77218b901 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -32,6 +32,8 @@ properties:
     minItems: 1
     maxItems: 3
 
+  msi-parent: true
+
 required:
   - compatible
   - reg
-- 
2.47.3

