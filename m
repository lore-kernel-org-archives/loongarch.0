Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38714AA2
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 09:51:12 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxy_IMx3VkNYQCAA--.5775S3;
	Tue, 30 May 2023 17:51:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxWdIJx3VkkmSAAA--.12317S2;
	Tue, 30 May 2023 17:51:06 +0800 (CST)
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
Subject: [PATCH v3 0/5] perf tools: Modify mksyscalltbl
Date: Tue, 30 May 2023 17:51:00 +0800
Message-Id: <1685440265-7021-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8BxWdIJx3VkkmSAAA--.12317S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XrWrtr17Jw4xCF1kGrWfKrg_yoWkKrg_CF
	Z2q3WDG3y5Xr47tFWfGFn8uFZ7tF4jqrn8XrsrWr9xJ34SqrZrXrWYv3y8uF4YqFW8Wry3
	Cr45XryUAFZ8CjkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	G7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AF
	wI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8
	JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8loGPUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Thanks Alexander, Leo and Ian for your reviews and suggestions.

v3:
  -- Add a new patch to declare syscalltbl_*[] as const for all archs,
     suggested by Ian.
  -- Add a new patch to use max_nr to define SYSCALLTBL_ARM64_MAX_ID.

v2:
  -- Add a new patch to rename create_table_from_c()
     to create_sc_table(), suggested by Leo.
  -- Simplify the shell script, suggested by Alexander.

Tiezhu Yang (5):
  perf tools: Declare syscalltbl_*[] as const for all archs
  perf arm64: Rename create_table_from_c() to create_sc_table()
  perf arm64: Handle __NR3264_ prefixed syscall number
  perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
  perf LoongArch: Simplify mksyscalltbl

 tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  | 17 ++++-----
 .../arch/loongarch/entry/syscalls/mksyscalltbl     | 40 +++++++---------------
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  2 +-
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  2 +-
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  2 +-
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  2 +-
 tools/perf/util/syscalltbl.c                       | 14 ++++----
 7 files changed, 32 insertions(+), 47 deletions(-)

-- 
2.1.0

