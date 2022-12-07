Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EBB136D
	for <loongarch@lists.linux.dev>; Wed,  7 Dec 2022 09:13:58 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx+OhSWZBj_McDAA--.5514S3;
	Wed, 07 Dec 2022 17:13:55 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxR1dSWZBj9yUnAA--.12280S3;
	Wed, 07 Dec 2022 17:13:54 +0800 (CST)
Subject: Re: [PATCH v7 1/4] LoongArch: Simulate branch and PC instructions
To: Huacai Chen <chenhuacai@kernel.org>
References: <1669986505-11322-1-git-send-email-yangtiezhu@loongson.cn>
 <1669986505-11322-2-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7CmTu4uF1F655N2dDcPxPBpYAe93HqQ38U_Lg84HVBAQ@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a3ed9194-ff36-19ff-8cdd-2cfba12c17a9@loongson.cn>
Date: Wed, 7 Dec 2022 17:13:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7CmTu4uF1F655N2dDcPxPBpYAe93HqQ38U_Lg84HVBAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxR1dSWZBj9yUnAA--.12280S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZrWDAr1fuw48AFWkuFyfJFb_yoWkGrgEkr
	4v9rnF9w1DZrnavw13KrWFgF95WFyUCw4UJ3ykJw1avw12qF93Grn5G3s3uryUZFs7Ar4a
	9r4Dt3yvkF9rWjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	G7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS
	14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU88Ma5UUUUU==



On 12/07/2022 11:06 AM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Fri, Dec 2, 2022 at 9:08 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> According to LoongArch Reference Manual, simulate branch and
>> PC instructions, this is preparation for later patch.
>>

...

>> +static inline unsigned long sign_extended(unsigned long val, unsigned int idx)
>> +{
>> +       if (val & (1UL << idx))
>> +               return ~((1UL << (idx + 1)) - 1) | val;
>> +       else
>> +               return ((1UL << (idx + 1)) - 1) & val;
>> +}
> You can use existing __SIGNEX and its friends rather than reinvent them.

Thanks for your reminder.

In my opinion, this static inline function sign_extended()
is much more clear and readable than the macro __SIGNEX()
defined in alternative.c, the helper function bs_dest_*()
seems redundant too, use "pc + sign_extended()" is a more
straightforward way to simulate instruction according to
the ISA Manual, so here I prefer to keep it as is.

Additionally, we can use sign_extended() instead of __SIGNEX()
in alternative.c, the __SIGNEX() related code can be removed
in a seperate patch in some day.

Thanks,
Tiezhu

