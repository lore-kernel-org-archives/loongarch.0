Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C863DC2FC
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 10:58:22 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXevMTcJkhbEKAA--.21301S3;
	Thu, 27 Jul 2023 18:58:20 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF83MTcJkvPs8AA--.29457S3;
	Thu, 27 Jul 2023 18:58:20 +0800 (CST)
Subject: Re: [PATCH v1 4/6] objtool/LoongArch: Enable orc to be built
To: Peter Zijlstra <peterz@infradead.org>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
 <1690272910-11869-5-git-send-email-yangtiezhu@loongson.cn>
 <20230725115106.GC3765278@hirez.programming.kicks-ass.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <936a4873-bfe6-cabc-fa63-b8ba14857243@loongson.cn>
Date: Thu, 27 Jul 2023 18:58:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230725115106.GC3765278@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxF83MTcJkvPs8AA--.29457S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFWrtr4kJw4kWw1kGw1fZrc_yoWkWwb_uw
	1fZ34kC34DKF4fJan8Kay5ZasrGr1UtFs5JryqvFZFq3WkJrWkCw4kGr93ZrWfXayrtF90
	qrnFqw13Wr9rZosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXU
	UUUU=



On 07/25/2023 07:51 PM, Peter Zijlstra wrote:
> On Tue, Jul 25, 2023 at 04:15:08PM +0800, Tiezhu Yang wrote:
>
> Previous Changelog had:
>
>> Define update_cfi_state() as a weak function which may be overwritten
>> by the arch-specific implementation.
>
> And then this patch does:
>
>> +int update_cfi_state(struct instruction *insn,
>> +		     struct instruction *next_insn,
>> +		     struct cfi_state *cfi, struct stack_op *op)
>> +{
>> +	struct cfi_reg *cfa = &cfi->cfa;
>> +	struct cfi_reg *regs = cfi->regs;

...

>> +	default:
>> +		WARN_FUNC("unknown stack-related instruction", insn->sec, insn->offset);
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>
> Why ?!? what is the actual irreconcilable difference?

I went in deeper to analysis the code and did more test,
the conclusion is that there is no need to define the
arch-specific update_cfi_state(), although it seems simpler
than the generic update_cfi_state(), the generic function
can handle all the cases and works well.

> If you want us to review this, you'll have to explain things.

I will drop the related changes in the next version, thank you.

Thanks,
Tiezhu

