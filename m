Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72DD7C
	for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 02:53:36 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axz7evUHRjvpEHAA--.17437S3;
	Wed, 16 Nov 2022 10:53:35 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VakUHRjO1MUAA--.35612S11;
	Wed, 16 Nov 2022 10:53:35 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS
Date: Wed, 16 Nov 2022 10:53:24 +0800
Message-Id: <20221116025324.1624-10-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221116025324.1624-1-zhangqing@loongson.cn>
References: <20221116025324.1624-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx9VakUHRjO1MUAA--.35612S11
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JryrGFW5Gw1kGF15WF1Dtrb_yoWDGrb_Ja
	1agw1Dur48J397uFn7Xw48W3yDA3WUXF1FkFnrXryxZa12gr13GrWDJw15C3WYga4UWrWY
	vaykAasxCr18tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	n7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4hF4DUUUU

Defaults enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS to convenient
ftrace tests.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 2d4678e6189a..0bbab17609b0 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -34,6 +34,7 @@ CONFIG_SYSFS_DEPRECATED=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
 CONFIG_USERFAULTFD=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
@@ -845,6 +846,7 @@ CONFIG_CRYPTO_DEV_VIRTIO=m
 CONFIG_PRINTK_TIME=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_SCHEDSTATS=y
 # CONFIG_DEBUG_PREEMPT is not set
-- 
2.36.0

