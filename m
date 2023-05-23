Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D5B1EA7C
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 10:22:17 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx6fHYk2xkqQgAAA--.200S3;
	Tue, 23 May 2023 18:22:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxkrDWk2xk3CNwAA--.57318S4;
	Tue, 23 May 2023 18:22:16 +0800 (CST)
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
	Leo Yan <leo.yan@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 2/2] perf LoongArch: Simplify mksyscalltbl
Date: Tue, 23 May 2023 18:22:07 +0800
Message-Id: <1684837327-18203-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1684837327-18203-1-git-send-email-yangtiezhu@loongson.cn>
References: <1684837327-18203-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8BxkrDWk2xk3CNwAA--.57318S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zry5GF45JF1xWr4rurWDXFb_yoW8Zr4xpF
	s3Cr9rta1rZr1xCwnF9r42qryrCws7Jr1YvFyvy3ySvw13C34rAry8Was3GFyxG3y8trWF
	vryFqryUKa18XaDanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bh8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
	CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
	z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
	0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
	I7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxfHUUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

In order to print the numerical entries of the syscall table,
there is no need to call the host compiler to build and then
run a program, this can be done directly by the shell script.

This is similar with commit 9854e7ad35fe ("perf arm64: Simplify
mksyscalltbl").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../arch/loongarch/entry/syscalls/mksyscalltbl     | 32 ++++++----------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
index c52156f..d7d97d5 100755
--- a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
+++ b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
@@ -22,40 +22,24 @@ create_table_from_c()
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
 	create_table_from_c
 	echo "};"
 }
 
-$gcc -E -dM -x c  -I $incpath/include/uapi $input	       \
-	|sed -ne 's/^#define __NR_//p' \
-	|sort -t' ' -k2 -n \
+$gcc -E -dM -x c -I $incpath/include/uapi $input		\
+	|awk '{if ($2~"__NR" && $3 !~"__NR3264_") {print}}'	\
+	|sed -ne 's/^#define __NR_//p;s/^#define __NR3264_//p'	\
+	|sort -t' ' -k2 -n					\
 	|create_table
-- 
2.1.0

