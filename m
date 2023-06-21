Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784C810E6
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 04:36:35 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxhMROfpJkpAAAAA--.1S3;
	Wed, 21 Jun 2023 12:36:30 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx33fqZ5JkIOoAAA--.446S3;
	Wed, 21 Jun 2023 11:00:59 +0800 (CST)
Subject: Re: [PATCH v2] perf symbol: Add LoongArch case in get_plt_sizes()
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <1684835873-15956-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4Es7qs54zr_hNPwn5MfgeLiKr3sgoTUP5iNj3JrH-1Uw@mail.gmail.com>
 <7a085947-9011-ebc9-a97d-7a62c755a978@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@linaro.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1c3c95c7-54e9-a65a-2f63-3a16af0fc2bf@loongson.cn>
Date: Wed, 21 Jun 2023 11:00:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7a085947-9011-ebc9-a97d-7a62c755a978@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx33fqZ5JkIOoAAA--.446S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUAVWUtwCF54CYxVCY
	1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAV
	WUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8sXo7UUUUU==



On 06/08/2023 03:01 PM, Tiezhu Yang wrote:
> Hi Arnaldo,
>
> On 05/23/2023 06:26 PM, Huacai Chen wrote:
>> Acked-by: Huacai Chen <chenhuacai@loongson.cn>
>>
>> On Tue, May 23, 2023 at 5:57 PM Tiezhu Yang <yangtiezhu@loongson.cn>
>> wrote:
>>>
>>> We can see the following definitions in bfd/elfnn-loongarch.c:

...

>
> Are you OK with this change?
> Could you please pick it up in your tree?

Ping. What is the status of this patch? Any more comments?
Is there a chance to merge it for this coming merge window?

Thanks,
Tiezhu

