Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1747412B93
	for <loongarch@lists.linux.dev>; Mon, 23 Oct 2023 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxyeojOzZlPuozAA--.25766S3;
	Mon, 23 Oct 2023 17:21:40 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx7twiOzZlLCQvAA--.34646S3;
	Mon, 23 Oct 2023 17:21:38 +0800 (CST)
Subject: Re: [PATCH v4 8/8] LoongArch: Add ORC stack unwinder support
To: Xi Ruoyao <xry111@xry111.site>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
 <1698048691-19521-9-git-send-email-yangtiezhu@loongson.cn>
 <4d3363eb5f4d864cfd171d89b1a13da5ef8b784c.camel@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1a06a70d-5dae-93a7-c200-c5b58f1241d5@loongson.cn>
Date: Mon, 23 Oct 2023 17:21:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4d3363eb5f4d864cfd171d89b1a13da5ef8b784c.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bx7twiOzZlLCQvAA--.34646S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr1fuw17WF4UZw17AFWUtrc_yoW3WrXEk3
	yruF1kC3yUZF1qg3W7Gan2vFy7Ga47Cw1UGFy0vrsrKryfta1DuF4qk3sYvFW8XF97CF1k
	uan8X343C3Z29osvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7k9NDU
	UUU



On 10/23/2023 04:43 PM, Xi Ruoyao wrote:
> On Mon, 2023-10-23 at 16:11 +0800, Tiezhu Yang wrote:
>> +ifdef CONFIG_OBJTOOL
>> +KBUILD_CFLAGS			+= -fno-optimize-sibling-calls -fno-jump-tables -falign-functions=4
>> +endif
>
> Why do we need to regress the code generation so much for objtool?

Add the above options is to avoid generating some intractable
instructions for objtool by now, I hope all of the extra options
can be removed if possible.

For example, without -fno-jump-tables, there exist many objtool
warnings like this:

"sibling call from callable instruction with modified stack frame"

If the enhanced special function about jump table is implemented
in objtool, -fno-jump-tables will be removed in the future.

Thanks,
Tiezhu

