Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440C44684
	for <loongarch@lists.linux.dev>; Mon, 14 Aug 2023 03:06:10 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxFvEbmtlkGt8XAA--.49190S3;
	Mon, 14 Aug 2023 11:06:03 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxxswamtlkd0RZAA--.558S3;
	Mon, 14 Aug 2023 11:06:02 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Remove noreturn attribute for die()
To: Huacai Chen <chenhuacai@kernel.org>
References: <1690871581-23944-1-git-send-email-yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c1f07d2a-8b91-667a-d978-63687396bacd@loongson.cn>
Date: Mon, 14 Aug 2023 11:06:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1690871581-23944-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bxxswamtlkd0RZAA--.558S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw4UAw43WFW8Zry8AFW8uFX_yoWDCwc_Cw
	1xJa93Kw48uFZYg3WDGa4fXFykWw4UKr95Xw1DXrW7W34ayws8Ww4kur9IvF48XFsY9Fs0
	kFZ3ta43ArnF9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfU
	UUUU=



On 08/01/2023 02:33 PM, Tiezhu Yang wrote:
> If notify_die() returns NOTIFY_STOP, there is no need to call
> make_task_dead(), we can remove noreturn attribute for die(),
> this is similar with arm64, riscv and csky.
>
> While at it, modify the die() declaration in ptrace.h to fix
> the following checkpatch warnings:
>
>   WARNING: function definition argument 'const char *' should also have an identifier name
>   WARNING: function definition argument 'struct pt_regs *' should also have an identifier name
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/ptrace.h |  2 +-
>  arch/loongarch/kernel/traps.c       | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

There is a similar patch for MIPS, here is the discussion,
https://lore.kernel.org/all/alpine.DEB.2.21.2308132148500.8596@angie.orcam.me.uk/

As suggested by Maciej W. Rozycki, I will update the commit message and 
split it into two patches, then I will send v2 later.

Thanks,
Tiezhu

