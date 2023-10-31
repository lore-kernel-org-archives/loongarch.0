Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010FF1C3A
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.110.17])
	by gateway (Coremail) with SMTP id _____8BxY_BBaEBlNd41AA--.39777S3;
	Tue, 31 Oct 2023 10:36:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.17])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axzy85aEBla0Q3AA--.53709S3;
	Tue, 31 Oct 2023 10:36:47 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	lvjianmin@loongson.cn,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 1/5] dt-bindings: interrupt-controller: loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
Date: Tue, 31 Oct 2023 10:36:36 +0800
Message-Id: <dc6621dd09b4710c66140b830d0b345682c7b707.1698717154.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1698717154.git.zhoubinbin@loongson.cn>
References: <cover.1698717154.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axzy85aEBla0Q3AA--.53709S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4rZFy8Cr1DXw45GF1rGrX_yoW8CF1kpF
	sxCw1DGr48tF17A390qa4vyF1fZFn5A3ZrWFZ7JayxAFWDXw1DXrW3KF15A3W3GrWUXFy7
	XryrKayUKa47AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8_gA5UUUUU==

Since the 'loongson,parent_int_map' attribute naming is non-standard, we
should use 'loongson,parent-int-map' instead.
Also, 'loongson,parent_int_map' should be marked as deprecated.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../interrupt-controller/loongson,liointc.yaml    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 00b570c82903..0d9511b8a792 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -55,6 +55,7 @@ properties:
     const: 2
 
   loongson,parent_int_map:
+    deprecated: true
     description: |
       This property points how the children interrupts will be mapped into CPU
       interrupt lines. Each cell refers to a parent interrupt line from 0 to 3
@@ -65,14 +66,21 @@ properties:
     minItems: 4
     maxItems: 4
 
+  loongson,parent-int-map:
+    description: |
+      Exactly the same as 'loongson,parent_int_map', we just replaced the
+      unstandardized use of underscores.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
 required:
   - compatible
   - reg
   - interrupts
   - interrupt-controller
   - '#interrupt-cells'
-  - loongson,parent_int_map
-
+  - loongson,parent-int-map
 
 unevaluatedProperties: false
 
@@ -109,11 +117,10 @@ examples:
       interrupts = <2>, <3>;
       interrupt-names = "int0", "int1";
 
-      loongson,parent_int_map = <0xf0ffffff>, /* int0 */
+      loongson,parent-int-map = <0xf0ffffff>, /* int0 */
                                 <0x0f000000>, /* int1 */
                                 <0x00000000>, /* int2 */
                                 <0x00000000>; /* int3 */
-
     };
 
 ...
-- 
2.39.3

