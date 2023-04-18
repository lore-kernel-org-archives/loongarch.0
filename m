Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1B51FA0
	for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 09:14:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxbdpgXz5k2mAeAA--.47211S3;
	Tue, 18 Apr 2023 17:14:08 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxGL1fXz5k_aosAA--.51154S2;
	Tue, 18 Apr 2023 17:14:07 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: Adjust the user_regset_copyin parameter to the correct offset
Date: Tue, 18 Apr 2023 17:14:06 +0800
Message-Id: <20230418091406.9286-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxGL1fXz5k_aosAA--.51154S2
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKw4xGw4fAF4DXr1kXF43KFg_yoWDurX_W3
	WSvw1DKr98Wa15uwnxGw15Jr12qa1SqFWSva9FyFW2qryDGw15tr4xG3WDCrZ09F4fuF45
	Aa9YgFZxAr4ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU7MmhUUUUU

Ensure that user_watch_state can be set correctly by the user.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/kernel/ptrace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 9c3bc1bbf2ff..f5bd7b1430ae 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -687,7 +687,7 @@ static int hw_break_set(struct task_struct *target,
 			break;
 
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &mask,
-					 offset, offset + PTRACE_HBP_ADDR_SZ);
+					 offset, offset + PTRACE_HBP_MASK_SZ);
 		if (ret)
 			return ret;
 
@@ -696,8 +696,8 @@ static int hw_break_set(struct task_struct *target,
 			return ret;
 		offset += PTRACE_HBP_MASK_SZ;
 
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &mask,
-					 offset, offset + PTRACE_HBP_MASK_SZ);
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl,
+					 offset, offset + PTRACE_HBP_CTRL_SZ);
 		if (ret)
 			return ret;
 
-- 
2.20.1

