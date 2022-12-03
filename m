Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797377B
	for <loongarch@lists.linux.dev>; Sat,  3 Dec 2022 13:54:27 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1vAJVYtjC_sCAA--.6923S3;
	Sat, 03 Dec 2022 21:54:18 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxZ1cIVYtjkBMlAA--.8238S2;
	Sat, 03 Dec 2022 21:54:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Make lscpu show "Model name" and "CPU family"
Date: Sat,  3 Dec 2022 21:54:16 +0800
Message-Id: <1670075656-4754-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8CxZ1cIVYtjkBMlAA--.8238S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF4fZrWrZr4rtrW7Xr43KFg_yoW8Ar1DpF
	W3CF4UJw4DGwn8J3yxta48uw4Y9Fn8J3W2van3GrW3C3WUXr4kXw10vw4xXF4Y9r1fKw4r
	ZFZYgF15KFyUJaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU2L05UUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When update the latest kernel on LoongArch, and then use lscpu command
to show cpuinfo, we can not see "Model name" and "CPU family", this is
because there are no matched patterns in /proc/cpuinfo, use small letter
of "Model Name" and "CPU Family" in show_cpuinfo() to fix it.

Here is the related code of lscpu:

static const struct cpuinfo_pattern type_patterns[] =
{
...
        DEF_PAT_CPUTYPE( "cpu family",          PAT_FAMILY,     family),
...
        DEF_PAT_CPUTYPE( "model name",          PAT_MODEL_NAME, modelname),
...
};

Link: https://github.com/util-linux/util-linux/blob/master/sys-utils/lscpu-cputype.c
Fixes: 7153c3cbb5b9 ("LoongArch: Add misc common routines")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 5c67cc4..eafd1cf 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -49,8 +49,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t\t: %ld\n", n);
 	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
 	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
-	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
-	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
+	seq_printf(m, "cpu family\t\t: %s\n", __cpu_family[n]);
+	seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);
 	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
 	seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
 	seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",
-- 
2.1.0

