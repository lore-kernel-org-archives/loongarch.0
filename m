Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3961C29
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 09:40:10 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8DxPOt5yOlk7SYcAA--.52193S3;
	Sat, 26 Aug 2023 17:40:09 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHCN4yOlkVCFkAA--.26955S2;
	Sat, 26 Aug 2023 17:40:09 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: acme@kernel.org
Cc: Yanteng Si <siyanteng@loongson.cn>,
	mingo@redhat.com,
	peterz@infradead.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	chenhuacai@kernel.org,
	linux-perf-users@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	loongarch@lists.linux.dev
Subject: [PATCH v3 0/3] tools/perf: Add loongarch cpuinfo and fix build warning
Date: Sat, 26 Aug 2023 17:39:59 +0800
Message-Id: <cover.1693040967.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHCN4yOlkVCFkAA--.26955S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw47Gr4fWrykCw4UtFWfXrc_yoW3XFc_Za
	yS93WDJryUCF9Yv3yak34rCryxWFZrAr95AayDKay5Zry5Jr1DWayDC3srZF1Fg3W5Xrn3
	Jw1fCrW5Zw4a9osvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==

v3:
* Using strcasest() correctly.
* Picking Huacai's Acked tag, I seem to have lost it in the last version.

v2:
* Switch to strcasestr().
* Use "test -f" instead of "[-f FILE]".

v1:
* LoongArch and riscv don't have tools/arch/xxxxx/include/uapi/asm/mman.h,
  let's modify the detection rules.
* Allow to use cpuinfo on loongarch.

Yanteng Si (3):
  perf/tools: Allow to use cpuinfo on LoongArch
  perf/trace: Fix mmap_flags for archs use generic mman.h
  perf/trace: Use "test -f" instead of "[-f FILE]"

 tools/perf/trace/beauty/mmap_flags.sh | 7 +++++--
 tools/perf/trace/beauty/mmap_prot.sh  | 5 +++--
 tools/perf/util/header.c              | 2 ++
 tools/perf/util/svghelper.c           | 2 +-
 4 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.31.4

