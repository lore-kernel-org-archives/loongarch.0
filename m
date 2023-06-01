Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9041390
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 02:44:24 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxfOsGBnhkkikDAA--.3784S3;
	Thu, 01 Jun 2023 10:44:22 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxOLYDBnhkHnGDAA--.16216S3;
	Thu, 01 Jun 2023 10:44:20 +0800 (CST)
Subject: Re: [PATCH v3 0/5] perf tools: Modify mksyscalltbl
To: Leo Yan <leo.yan@linaro.org>
References: <1685440265-7021-1-git-send-email-yangtiezhu@loongson.cn>
 <20230531235455.GA132356@leoy-huanghe>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Hans-Peter Nilsson <hp@axis.com>,
 Alexander Kapshuk <alexander.kapshuk@gmail.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b0498d76-7e66-1060-2555-be1a09018c88@loongson.cn>
Date: Thu, 1 Jun 2023 10:44:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230531235455.GA132356@leoy-huanghe>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxOLYDBnhkHnGDAA--.16216S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKFykXryrKr1kKr1DCr1UAwb_yoW3CFb_WF
	nFgr1UC3y5Wr17KF4DKan8ZFyaqF9rXFs8t3s7Ww1kXw13Xr9xJFZa9ryrua1jyrWvqFZI
	kFs8Xry8ZFZ8ujkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2txhDUUUU



On 06/01/2023 07:55 AM, Leo Yan wrote:
> Hi Tiezhu,
>
> On Tue, May 30, 2023 at 05:51:00PM +0800, Tiezhu Yang wrote:
>
> [...]
>
>> Tiezhu Yang (5):
>>   perf tools: Declare syscalltbl_*[] as const for all archs
>>   perf arm64: Rename create_table_from_c() to create_sc_table()
>>   perf arm64: Handle __NR3264_ prefixed syscall number
>>   perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
>>   perf LoongArch: Simplify mksyscalltbl
>
> Either in my mail inbox or on lore site [1], it only shows up 3 patches
> but not the 5 patches.  Please consider to resend the series.

Here is the complete patchset:

[PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
https://lore.kernel.org/linux-perf-users/1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

