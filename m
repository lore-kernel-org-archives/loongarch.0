Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0255C2F45
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 13:30:11 +0000 (UTC)
Received: from loongson.cn (unknown [106.39.149.70])
	by gateway (Coremail) with SMTP id _____8CxPuvhRuZjZNYQAA--.33146S3;
	Fri, 10 Feb 2023 21:30:09 +0800 (CST)
Received: from [192.168.3.5] (unknown [106.39.149.70])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axfb7fRuZjaHQwAA--.29998S3;
	Fri, 10 Feb 2023 21:30:09 +0800 (CST)
Message-ID: <cd21fa7a-e74e-9eb3-50b2-07c876b774e8@loongson.cn>
Date: Fri, 10 Feb 2023 21:30:07 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] LoongArch: add checksum optimization for 64-bit system
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230209035839.2610277-1-maobibo@loongson.cn>
 <e6bb59c32134477aa4890047ae5ad51b@AcuMS.aculab.com>
 <741b2246-d609-ccc6-bf55-d6b0b5e54b54@loongson.cn>
 <2aa6243491784e74960182dc12968170@AcuMS.aculab.com>
 <CAAhV-H7BgBASt_CpSQgS6MNbzxODhoq8ykK5ZAn2y3ZOekXM9g@mail.gmail.com>
 <0fe7ed7c-7161-65d5-a09f-12db6ccda05a@loongson.cn>
 <b17430342e9e4c39b53004d842ea9c55@AcuMS.aculab.com>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <b17430342e9e4c39b53004d842ea9c55@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Axfb7fRuZjaHQwAA--.29998S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFWUWry3Zr1UAw15Cw4xtFb_yoW5ur17pr
	WSkr15GFs2qF95ur1xtw1xXrySv393GF15Jrs8Jr90kas8JrnaqFykKrWYkF9rur4fCF12
	qF10qwsru3WDAw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8fsqJUUUUU==



On 2023/2/10 19:08, David Laight wrote:
> From: maobibo
>> Sent: 10 February 2023 10:06
>>
>> With the test cases
>>    https://github.com/bibo-mao/bench/tree/master/csum
>>
>> Tested with different buffer size 4096/1472/250/40, here is the output on my
>> loongarch machine. Loops times is 0x100000, and time cost unit is milliseconds,
>> and the smaller value will be better.
>>
>>
>> buf size[4096] loops[0x100000] times[us]: csum uint128 344473 asm method 373391 uint64 741412
>> buf size[1472] loops[0x100000] times[us]: csum uint128 131849 asm method 138533 uint64 271317
>> buf size[ 250] loops[0x100000] times[us]: csum uint128 34512 asm method 36294 uint64 51576
>> buf size[  40] loops[0x100000] times[us]: csum uint128 12182 asm method 23874 uint64 15769
> 
> What do those work out as in bytes/clock?
> 
> Rather than run 1000s of iterations (and be hit by interrupts etc)
> I sometimes just use an accurate cycle counter and measure the
> time for a single buffer (or varying length).
> Save and print the values of 10 calls and you'll get pretty
> consistent values after the first couple (cold cache).
> Then you can work out how long each iteration of the main loop costs.
> 
CPU freq is 2G, from result for buffer size 4096, it is 5.8 bytes/clock.
Freq of timestamp count on Loongarch is 100MHZ at constant ,and there is 
no cpu cycle count register on the platform.

> I think you have to execute 4 instructions for each 64bit word.
> One memory read, the main add, a setle and the add of the carry.
> 
> For a simple cpu that is always going to be 4 clocks.
> But if there are delay slots after the memory read you can
> fill them with the alu instructions for an earlier read.
> You also need an add and bne for the address for each iteration.
> So unrolling the loop further will help.
There is no delay slot on Loongarch platform, yes for 8bytes csum
calculation at least 4 clocks should be used.

> 
> OTOH if your cpu can execute multiple instructions in one clock
> you can expect to do a lot better.
> With 3 ALU instructions (and one read) you should be able to
> find a code sequence that will run at 8 bytes/clock.
> With 4 ALU it is likely that the loop instructions can also
> execute in parallel - so you don't need massive loop unrolling.
> 
> Unless the cpu is massively 'out of order' (like some x86)
> I'd expect the best code to interleave the reads and alu
> operations for earlier values - rather than having all
> the reads at the top of the loop.
I do not think so, like memcpy asm function, memory accessing is
put together, memory access can be stalled if not in L1 cache for
the first time. cacheline will be load at cpu read buffer, the next
memory read in the cache line will cost 1 cycle.
However I will try the method  interleave the reads and alu operations.

> So the loop would be a repeating pattern of instructions
> with some values being carried between iterations.
> 
> I doubt you'll get a loop to execute every clock, but
> a two clock loop is entirely possible.
> It rather depends how fast the instruction decoder
> handles the (predicted) branch.
yes, branch prediction is always expensive and hard to control  :(

Regards
Bibo, Mao
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

