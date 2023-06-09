Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ED9ED8;
	Fri,  9 Jun 2023 06:51:05 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxTuvVy4JkbvAAAA--.3020S3;
	Fri, 09 Jun 2023 14:51:01 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxZuTSy4Jk8QsKAA--.30794S3;
	Fri, 09 Jun 2023 14:51:00 +0800 (CST)
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
To: Arnd Bergmann <arnd@arndb.de>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev, linux-ia64@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
Date: Fri, 9 Jun 2023 14:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxZuTSy4Jk8QsKAA--.30794S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1UWFy8Kr1kJFy7Kr47KFX_yoW5JFyrpF
	4UGF1j9r4kAr1fAFn2yw4jqa4Fyws7KF1aq3s0gryxJFs0gFyrtry29w4agFWqvr18Jr4j
	93yUXFy5uay0yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wr
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==



On 06/08/2023 08:56 PM, Arnd Bergmann wrote:
> On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
>> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>>
>>> I think we are completely safe on the architectures that were
>>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>>> loongarch, nios2, and hexagon), but for the older ones there
>>> is a regression risk. Especially on targets that are not that
>>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>>> a good chance that users are stuck on ancient toolchains.
>>> It's probably also a safe assumption that anyone with an older
>>> libc version won't be using the latest kernel headers, so
>>> I think we can still do this across architectures if both
>>> glibc and musl already require a compiler that is new enough,
>>> or alternatively if we know that the kernel headers require
>>> a new compiler for other reasons and nobody has complained.
>>>
>>> For glibc, it looks the minimum compiler version was raised
>>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>>
>>> In musl, the documentation states that at least gcc-3.4 or
>>> clang-3.2 are required, which probably predate the
>>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>>> released in 2011, and building musl itself explicitly
>>> does not require kernel uapi headers, so this may not
>>> be too critical.
>>>
>>> There is also uClibc, but I could not find any minimum
>>> supported compiler version for that. Most commonly, this
>>> one is used for cross-build environments, so it's also
>>> less likely to have libc/gcc/headers being wildly out of
>>> sync. Not sure.
>>>
>>>       Arnd
>>>
>>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>>
>>
>> Thanks Arnd for the detailed reply.
>> Any more comments? What should I do in the next step?
>
> I think the summary is "it's probably fine", but I don't know
> for sure, and it may not be worth the benefit.

Thank you, it is very clear now.

> Maybe you can prepare a v2 that only does this for the newer
> architectures I mentioned above, with and an explanation and
> link to my above reply in the file comments?

Only arm64, riscv and loongarch belong to the newer architectures
which are related with this change, I am not sure it is necessary
to "unify" uapi bitsperlong.h for them.

Anyway, let me try, I will send a new version, maybe this is going
to progress in the right direction.

Thanks,
Tiezhu

