Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048A57F
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 08:11:43 +0000 (UTC)
Received: from [192.168.100.8] (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT947N6xisRZIAA--.12187S3;
	Fri, 17 Jun 2022 16:11:41 +0800 (CST)
Message-ID: <a20aac56-3a52-4eed-e48e-644930216fbe@loongson.cn>
Date: Fri, 17 Jun 2022 16:11:40 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] docs/zh_CN: rewrite all the notes
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev
References: <cover.1655450200.git.siyanteng@loongson.cn>
 <151c8e9725b51d8629335a828ab0115705e7696c.1655450200.git.siyanteng@loongson.cn>
 <CAAhV-H5-wZ0WBy3v=ZRQ-uYDcHLQKtYL359-GgigONZw6fWjmw@mail.gmail.com>
From: YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <CAAhV-H5-wZ0WBy3v=ZRQ-uYDcHLQKtYL359-GgigONZw6fWjmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxT947N6xisRZIAA--.12187S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4kuFWrCr1xZryfJrWDurg_yoW7JF43pF
	92kr9akF1kCry7Jr4kCF4Uua1IkF1xC3W7CF4rK3WkJrnrAwn0kr18tFyDXFW3GryayFWv
	vr45Kr4kZF1Yk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Gb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8trc3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/


在 2022/6/17 16:06, Huacai Chen 写道:
> Hi, Yanteng,
>
> On Fri, Jun 17, 2022 at 3:17 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> Note is an admonition, let's use the directives
>> implemented in the reference reStructuredText parser.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/loongarch/introduction.rst | 14 ++++++++------
>>   .../zh_CN/loongarch/irq-chip-model.rst            | 15 +++++++++------
>>   2 files changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
>> index e31a1a928c48..a8a5aaca7d94 100644
>> --- a/Documentation/translations/zh_CN/loongarch/introduction.rst
>> +++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
>> @@ -46,10 +46,11 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
>>   ``$r23``-``$r31`` ``$s0``-``$s8`` 静态寄存器          是
>>   ================= =============== =================== ==========
>>
>> -注意：``$r21``寄存器在ELF psABI中保留未使用，但是在Linux内核用于保存每CPU
>> -变量基地址。该寄存器没有ABI命名，不过在内核中称为``$u0``。在一些遗留代码
>> -中有时可能见到``$v0``和``$v1``，它们是``$a0``和``$a1``的别名，属于已经废弃
>> -的用法。
>> +.. note::
>> +    注意： ``$r21``寄存器在ELF psABI中保留未使用，但是在Linux内核用于保
>> +    存每CPU变量基地址。该寄存器没有ABI命名，不过在内核中称为``$u0``。在一
>> +    些遗留代码中有时可能见到``$v0``和``$v1``，它们是``$a0``和``$a1``的
>> +    别名，属于已经废弃的用法。
> There should be a space between ``$r21`` and Chinese text for HTML
> display, please fix all of such problems, thanks.

OK!


Thanks,

Yanteng

>
> Huacai
>>   浮点寄存器
>>   ----------
>> @@ -68,8 +69,9 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
>>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  静态寄存器          是
>>   ================= ================== =================== ==========
>>
>> -注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0``
>> -和 ``$a1`` 的别名，属于已经废弃的用法。
>> +.. note::
>> +    注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是
>> +    ``$a0``和 ``$a1`` 的别名，属于已经废弃的用法。
>>
>>
>>   向量寄存器
>> diff --git a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
>> index 2a4c3ad38be4..49b7bdb59a4a 100644
>> --- a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
>> +++ b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
>> @@ -147,9 +147,12 @@ PCH-LPC::
>>
>>     https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (英文版)
>>
>> -注：CPUINTC即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其中断
>> -控制逻辑；LIOINTC即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；EIOINTC
>> -即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；HTVECINTC即《龙芯3A5000
>> -处理器使用手册》第14.3节所描述的“HyperTransport中断”；PCH-PIC/PCH-MSI即《龙芯7A1000桥
>> -片用户手册》第5章所描述的“中断控制器”；PCH-LPC即《龙芯7A1000桥片用户手册》第24.3节所
>> -描述的“LPC中断”。
>> +.. note::
>> +   注：
>> +    - CPUINTC：即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其
>> +      中断控制逻辑；
>> +    - LIOINTC：即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；
>> +    - EIOINTC：即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；
>> +    - HTVECINTC：即《龙芯3A5000处理器使用手册》第14.3节所描述的“HyperTransport中断”；
>> +    - PCH-PIC/PCH-MSI：即《龙芯7A1000桥片用户手册》第5章所描述的“中断控制器”；
>> +    - PCH-LPC：即《龙芯7A1000桥片用户手册》第24.3节所描述的“LPC中断”。
>> --
>> 2.27.0
>>

