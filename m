Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E93D171BA
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 10:10:05 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1fB8y3Vk6oUCAA--.5729S3;
	Tue, 30 May 2023 18:10:04 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axo8B6y3Vk_WqAAA--.12905S5;
	Tue, 30 May 2023 18:10:04 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH RESEND v3 3/5] perf arm64: Handle __NR3264_ prefixed syscall number
Date: Tue, 30 May 2023 18:09:59 +0800
Message-Id: <1685441401-8709-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Axo8B6y3Vk_WqAAA--.12905S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7trWxur1Dtw1xtw4ktF15CFg_yoW8JFW8pw
	s3C34UtFZ5GF10kw1xur4jqFZ5CF4kJF1UKryjyrW3Crn8J345tr1YqasYkFW7Xw1xK3y5
	Zr1FqFy5XF18Xw7anT9S1TB71UUUU1JqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS
	14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
	kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
	WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jP-BNUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

After commit 9854e7ad35fe ("perf arm64: Simplify mksyscalltbl"),
in the generated syscall table file syscalls.c, there exist some
__NR3264_ prefixed syscall numbers such as [__NR3264_ftruncate],
it looks like not so good, just do some small filter operations
to handle __NR3264_ prefixed syscall number as a digital number.

Without this patch:

  [__NR3264_ftruncate] = "ftruncate",

With this patch:

  [46] = "ftruncate",

Suggested-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm64/entry/syscalls/mksyscalltbl | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl b/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
index 84976dc..0bcd64a 100755
--- a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
+++ b/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
@@ -40,6 +40,7 @@ create_table()
 }
 
 $gcc -E -dM -x c -I $incpath/include/uapi $input \
-	|sed -ne 's/^#define __NR_//p' \
-	|sort -t' ' -k2 -n	       \
+	|awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
+		sub("^#define __NR(3264)?_", "");
+		print | "sort -k2 -n"}' \
 	|create_table
-- 
2.1.0

