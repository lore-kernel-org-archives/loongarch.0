Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843E1C2E
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.110.17])
	by gateway (Coremail) with SMTP id _____8AxZ+hOaEBliN41AA--.4121S3;
	Tue, 31 Oct 2023 10:37:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.17])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxH91LaEBlgEQ3AA--.55486S3;
	Tue, 31 Oct 2023 10:37:01 +0800 (CST)
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
Subject: [PATCH v3 5/5] MIPS: Loongson64: DTS: Fix 'loongson,parent_int_map' references
Date: Tue, 31 Oct 2023 10:36:58 +0800
Message-Id: <aeb33087954df5adac49646b665af92d1b9adeb6.1698717154.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxH91LaEBlgEQ3AA--.55486S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr13XFyxAFWkJw4fCw1DXFc_yoW5tr1fpw
	13Aa18Gw4xKr17A398G34UJr1fZF90yFZrWF4xGFWxA39aga4UXr1fJF1rJrs3GrW5Xa42
	9r1vgrWUKFy8CabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxxhdUUUUU=

Since 'loongson,parent_int_map' has been deprecated, replace all
relevant references in the MIPS loongson dts{i} with
'loongson,parent-int-map'.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 4 ++--
 arch/mips/boot/dts/loongson/loongson64c-package.dtsi     | 2 +-
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 2 +-
 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index f878f47e4501..36f499a3772e 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -71,7 +71,7 @@ liointc0: interrupt-controller@1fe11400 {
 			interrupts = <2>;
 			interrupt-names = "int0";
 
-			loongson,parent_int_map = <0xffffffff>, /* int0 */
+			loongson,parent-int-map = <0xffffffff>, /* int0 */
 						<0x00000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
@@ -91,7 +91,7 @@ liointc1: interrupt-controller@1fe11440 {
 			interrupts = <3>;
 			interrupt-names = "int1";
 
-			loongson,parent_int_map = <0x00000000>, /* int0 */
+			loongson,parent-int-map = <0x00000000>, /* int0 */
 						<0xffffffff>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64c-package.dtsi b/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
index 5bb876a4de52..38de0108e804 100644
--- a/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
@@ -35,7 +35,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0xf0ffffff>, /* int0 */
+			loongson,parent-int-map = <0xf0ffffff>, /* int0 */
 						<0x0f000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
index d4314f62ccc2..8972adcb83d6 100644
--- a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
@@ -32,7 +32,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0x00ffffff>, /* int0 */
+			loongson,parent-int-map = <0x00ffffff>, /* int0 */
 						<0xff000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
index d0588d81e0c2..88642fee1bbd 100644
--- a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
+++ b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
@@ -34,7 +34,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0x00000001>, /* int0 */
+			loongson,parent-int-map = <0x00000001>, /* int0 */
 						<0xfffffffe>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
-- 
2.39.3

