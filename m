Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35591E516
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 09:57:55 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxR_EijmxkHAYAAA--.93S3;
	Tue, 23 May 2023 17:57:54 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_7MhjmxkvhxwAA--.56731S2;
	Tue, 23 May 2023 17:57:54 +0800 (CST)
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
Cc: Leo Yan <leo.yan@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2] perf symbol: Add LoongArch case in get_plt_sizes()
Date: Tue, 23 May 2023 17:57:53 +0800
Message-Id: <1684835873-15956-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Dx_7MhjmxkvhxwAA--.56731S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WF4fJFy7Cr4fKw4UWFy8Zrb_yoW8Gry5pw
	nxuFW8K3WDtFnxG3WrJF4rXF4fWFsavFy2gFy3XrWv9Fs7uw10grWxAFyY9FWUXFykXa40
	vr1qk3yxuF10qr7anT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
	Aaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

We can see the following definitions in bfd/elfnn-loongarch.c:

  #define PLT_HEADER_INSNS 8
  #define PLT_HEADER_SIZE (PLT_HEADER_INSNS * 4)

  #define PLT_ENTRY_INSNS 4
  #define PLT_ENTRY_SIZE (PLT_ENTRY_INSNS * 4)

so plt header size is 32 and plt entry size is 16 on LoongArch,
let us add LoongArch case in get_plt_sizes().

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-loongarch.c
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: Add EM_LOONGARCH definition to avoid build error

 tools/perf/util/symbol-elf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index b2ed9cc..b3dbf6c 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -35,6 +35,10 @@
 #define EM_AARCH64	183  /* ARM 64 bit */
 #endif
 
+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH	258
+#endif
+
 #ifndef ELF32_ST_VISIBILITY
 #define ELF32_ST_VISIBILITY(o)	((o) & 0x03)
 #endif
@@ -411,6 +415,10 @@ static bool get_plt_sizes(struct dso *dso, GElf_Ehdr *ehdr, GElf_Shdr *shdr_plt,
 		*plt_header_size = 32;
 		*plt_entry_size = 16;
 		return true;
+	case EM_LOONGARCH:
+		*plt_header_size = 32;
+		*plt_entry_size = 16;
+		return true;
 	case EM_SPARC:
 		*plt_header_size = 48;
 		*plt_entry_size = 12;
-- 
2.1.0

