Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC0A7F
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 01:13:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.155])
	by gateway (Coremail) with SMTP id _____8BxLuvCpeFjt10PAA--.30108S3;
	Tue, 07 Feb 2023 09:13:38 +0800 (CST)
Received: from [10.20.42.155] (unknown [10.20.42.155])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxaL3CpeFjTCsrAA--.17069S3;
	Tue, 07 Feb 2023 09:13:38 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Make -mstrict-align be configurable
To: Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
References: <20230202084238.2408516-1-chenhuacai@loongson.cn>
 <5fc85453-1e2c-1f00-7879-1b5fa318c78a@xen0n.name>
 <5303aeda-5c66-ede6-b3ac-7d8ebd73ec70@loongson.cn>
 <b1809500e4d55564a1084a3014fb9603ba3d1438.camel@xry111.site>
 <3b17d229-bad4-e6a0-9055-c585dd5a62e4@loongson.cn>
 <b9f274ad-591b-40b5-9441-a45fe67b5b8d@app.fastmail.com>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <85c36350-34d2-d333-8e47-255914d3fdaa@loongson.cn>
Date: Tue, 7 Feb 2023 09:13:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b9f274ad-591b-40b5-9441-a45fe67b5b8d@app.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxaL3CpeFjTCsrAA--.17069S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tw1UGF15uw45tr1kCF13XFb_yoW8tFykpa
	yYkF9FkF1DJr18Aay0y34rWFWYvw18Kw15W3W0g3s8Wr1qgF92qFW2qw1ruFWrKw1xCw12
	vFy0q3W7ur4jyaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU



On 2023/2/6 下午9:22, Arnd Bergmann wrote:
> On Mon, Feb 6, 2023, at 14:13, Jianmin Lv wrote:
>> On 2023/2/6 下午7:18, Xi Ruoyao wrote:
>>> On Mon, 2023-02-06 at 18:24 +0800, Jianmin Lv wrote:
>>>> Hi, Xuerui
>>>>
>>>> I think the kernels produced with and without -mstrict-align have mainly
>>>> following differences:
>>>> - Diffirent size. I build two kernls (vmlinux), size of kernel with
>>>> -mstrict-align is 26533376 bytes and size of kernel without
>>>> -mstrict-align is 26123280 bytes.
>>>> - Diffirent performance. For example, in kernel function jhash(), the
>>>> assemble code slices with and without -mstrict-align are following:
>>>
>>> But there are still questions remaining:
>>>
>>> (1) Is the difference contributed by a bad code generation of GCC?  If
>>> true, it's better to improve GCC before someone starts to build a distro
>>> for LA264 as it would benefit the user space as well.
>>>
>> AFAIK, GCC builds to produce unaligned-access-enabled target binary by
>> default (without -mstrict-align) for improving user space performance
>> (small size and runtime high performance), which is also based the fact
>> that the vast majority of LoongArch CPUs support unaligned-access.
>>
>>> (2) Is there some "big bad unaligned access loop" on a hot spot in the
>>> kernel code?  If true, it may be better to just refactor the C code
>>> because doing so will benefit all ports, not only LoongArch.  Otherwise,
>>> it may be unworthy to optimize for some cold paths.
>>>
>> Frankly, I'm not sure if there is this kind of hot code in kernel, I
>> just see the difference from different kernel size and different
>> assemble code slice. And I'm afraid that it may be difficult to judge
>> whether it is reasonable hot code or not if exists.
> 
> Just look for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, this will
> show you code locations that use different implementations based on
> whether the kernel should run on CPUs without unaligned access or
> not.
> 
>        Arnd
> 

Got it, thank you very much, I greped 
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and found many matched cases 
including driver, lib, net and so on, it seems that it's reasonable to 
use high performance way for CPUs with HAVE_EFFICIENT_UNALIGNED_ACCESS 
configured.


