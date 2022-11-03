Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BE86FD6
	for <loongarch@lists.linux.dev>; Thu,  3 Nov 2022 13:24:48 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxStgewWNjgD0EAA--.12876S3;
	Thu, 03 Nov 2022 21:24:46 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxiFccwWNjTA0MAA--.16617S3;
	Thu, 03 Nov 2022 21:24:44 +0800 (CST)
Subject: Re: [PATCH v3] checksyscalls: Ignore fstat to silence build warning
 on LoongArch
To: Andrew Morton <akpm@linux-foundation.org>
References: <1661830021-8643-1-git-send-email-yangtiezhu@loongson.cn>
 <f794e452-eb04-88df-afa8-991bd40eb3d6@loongson.cn>
 <6ef6686dea98a65176af01f518d30727bde9b2b7.camel@xry111.site>
 <23cb8d88-f18c-cd6d-a0b8-6c7c8c47ad8b@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <410dcaaf-722c-50ee-9fec-6c80db068eff@loongson.cn>
Date: Thu, 3 Nov 2022 21:24:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <23cb8d88-f18c-cd6d-a0b8-6c7c8c47ad8b@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxiFccwWNjTA0MAA--.16617S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJF18ArWUWFyDKrWDtr1rXrb_yoW8Aw18pa
	48Aan8Zr48JFy8Aan2k3yxZFyFv3sxA3s3Wrn8Xwn8Arn0qFn3JrySvay5urnFgr1Ykr12
	93Z7W34xZFWjyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UUUUU==

Hi Andrew,

On 10/12/2022 02:19 PM, Tiezhu Yang wrote:
>
> Cc KERNEL BUILD maintainers:
>
> Masahiro Yamada <masahiroy@kernel.org>
> Michal Marek <michal.lkml@markovi.net>
> Nick Desaulniers <ndesaulniers@google.com>
>
> On 10/09/2022 10:01 PM, Xi Ruoyao wrote:
>> On Sun, 2022-10-09 at 12:33 +0800, Tiezhu Yang wrote:
>>>
>>>
>>> On 08/30/2022 11:27 AM, Tiezhu Yang wrote:
>>>> fstat is replaced by statx on the new architecture, so an exception
>>>> is added to the checksyscalls script to silence the following build
>>>> warning on LoongArch:
>>>>
>>>>   CALL    scripts/checksyscalls.sh
>>>> <stdin>:569:2: warning: #warning syscall fstat not implemented [-
>>>> Wcpp]
>>>
>>> Hi all,
>>>
>>> The above warning still exists when build the latest loongarch-next.
>>>
>>> Do you know which tree this patch will go through?
>>>
>>> Could you please pick it up via your tree in this merge window?
>>
>> A similar change 3ef6ca4f354c ("checksyscalls: Unconditionally ignore
>> fstat{,at}64") was merged through RISC-V tree, so it should be OK to
>> merge this from loongarch-next.
>>
>> Not sure if we need to get an Ack from someone first though.
>>
>
> Since this is a kernel build warning, maybe it is proper through
> linux-kbuild.git.
>
> https://lore.kernel.org/lkml/1661830021-8643-1-git-send-email-yangtiezhu@loongson.cn/
>
>
> Thanks,
> Tiezhu

The build warning still exists when build the latest Linux 6.1-rc3 on
LoongArch, if you are OK with this change, please apply it through your
mm tree, thank you.

"If you cannot find a maintainer for the subsystem you are working on,
Andrew Morton (akpm@linux-foundation.org) serves as a maintainer of
last resort."
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Thanks,
Tiezhu

