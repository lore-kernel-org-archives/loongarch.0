Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A688A63A
	for <loongarch@lists.linux.dev>; Mon, 29 May 2023 02:25:07 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxlPCYDHRkXxkCAA--.4872S3;
	Mon, 29 May 2023 10:23:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxRrWSDHRkNzh+AA--.9081S5;
	Mon, 29 May 2023 10:23:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Hans-Peter Nilsson <hp@axis.com>,
	Alexander Kapshuk <alexander.kapshuk@gmail.com>,
	Leo Yan <leo.yan@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 3/3] perf LoongArch: Simplify mksyscalltbl
Date: Mon, 29 May 2023 10:23:14 +0800
Message-Id: <1685326994-11987-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1685326994-11987-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685326994-11987-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8BxRrWSDHRkNzh+AA--.9081S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zry5GF45JrWUKry5XFyUAwb_yoW8uF1fpF
	sak3srta1rZr1xCwnF9r42qF1rCws7Jr1YqFyvkrWSvw43C34Fyr10qas3JFy7G3yxtrWF
	vryIqryUKF48XaDanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
	CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
	z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
	0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfHUhUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

In order to print the numerical entries of the syscall table,
there is no need to call the host compiler to build and then
run a program, this can be done directly by the shell script.

This is similar with commit 9854e7ad35fe ("perf arm64: Simplify
mksyscalltbl"). For now, the mksyscalltbl file of LoongArch is
almost same with arm64.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
---
 .../arch/loongarch/entry/syscalls/mksyscalltbl     | 36 ++++++----------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
index c52156f..8df7b0b 100755
--- a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
+++ b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
@@ -18,44 +18,28 @@ if ! test -r $input; then
 	exit 1
 fi
 
-create_table_from_c()
+create_sc_table()
 {
 	local sc nr last_sc
 
-	create_table_exe=`mktemp ${TMPDIR:-/tmp}/create-table-XXXXXX`
-
-	{
-
-	cat <<-_EoHEADER
-		#include <stdio.h>
-		#include "$input"
-		int main(int argc, char *argv[])
-		{
-	_EoHEADER
-
 	while read sc nr; do
-		printf "%s\n" "	printf(\"\\t[%d] = \\\"$sc\\\",\\n\", $nr);"
-		last_sc=$nr
+		printf "%s\n" "	[$nr] = \"$sc\","
+		last_sc=$sc
 	done
 
-	printf "%s\n" "	printf(\"#define SYSCALLTBL_LOONGARCH_MAX_ID %d\\n\", $last_sc);"
-	printf "}\n"
-
-	} | $hostcc -I $incpath/include/uapi -o $create_table_exe -x c -
-
-	$create_table_exe
-
-	rm -f $create_table_exe
+	printf "%s\n" "#define SYSCALLTBL_LOONGARCH_MAX_ID __NR_$last_sc"
 }
 
 create_table()
 {
+	echo "#include \"$input\""
 	echo "static const char *syscalltbl_loongarch[] = {"
-	create_table_from_c
+	create_sc_table
 	echo "};"
 }
 
-$gcc -E -dM -x c  -I $incpath/include/uapi $input	       \
-	|sed -ne 's/^#define __NR_//p' \
-	|sort -t' ' -k2 -n \
+$gcc -E -dM -x c -I $incpath/include/uapi $input \
+	|awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
+		sub("^#define __NR(3264)?_", "");
+		print | "sort -k2 -n"}' \
 	|create_table
-- 
2.1.0

