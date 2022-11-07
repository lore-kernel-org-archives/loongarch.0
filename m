Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DA215A9
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 02:59:51 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.24.7])
	by gateway (Coremail) with SMTP id _____8BxfdqmdGhjYu4EAA--.16771S3;
	Mon, 07 Nov 2022 10:59:50 +0800 (CST)
Received: from [192.168.100.112] (unknown [223.106.24.7])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLuKkdGhjRUAOAA--.39954S3;
	Mon, 07 Nov 2022 10:59:49 +0800 (CST)
Message-ID: <d0a94b87-c319-e004-c456-444a24ddac27@loongson.cn>
Date: Mon, 7 Nov 2022 10:59:48 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <ac5f393a-be3c-3cd2-4738-b0537bc6e84e@xen0n.name>
 <95a90f588b9193ee0f9895fbf238828a3dbbe958.camel@xry111.site>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <95a90f588b9193ee0f9895fbf238828a3dbbe958.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLuKkdGhjRUAOAA--.39954S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7try7ArWUGw4xArWUuFyrCrg_yoW8Ww1fpa
	yIka1Ika1DJrnxuw1rZ3WUuFy8Xr1rXayDtrs3Gr98uFn8CF1kuFWSq3y29F4Uur95C3W5
	t39YgF1DZFyqkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bakYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
	yTuYvjxU70PfDUUUU

Hi Ruoyao:

在 2022/11/6 18:15, Xi Ruoyao 写道:
> On Sun, 2022-11-06 at 17:15 +0800, WANG Xuerui wrote:
>> And, although we're already aware of the part-UEFI and part-FDT usage
>> pattern, and the arch UEFI code already has consideration for such, it
>> still makes me a bit wary because you risk losing standards compliance
>> and creating maintenance burden for admins/users/devs alike by relying
>> on this not-really-UEFI-but-advertising-as-such thing. I'd still suggest
>> you try throwing together something fully DT, to at least experiment a
>> little with. You already have to rewrite pretty much everything with all
>> the boot protocol changes in the past few months, so this would probably
>> not even hurt, and the burden on the LoongArch/generic UEFI infra could
>> be lessened even further if this plays out. And you can always continue
>> working on this change if it turns out infeasible to do so.
> 
> AFAIK using UEFI with FDT (instead of ACPI) is fully allowed and
> documented by the standard (section 4.6.1.3 of the UEFI spec).  It may
> be not possible or not worthy to implement ACPI for 2K systems, then FDT
> will be the only choice.
> 
> In ARM64 ecosystem, SBBR (for server) demands UEFI+ACPI, EBBR (for
> embedded) allows UEFI+ACPI or UEFI+FDT.
> 

Yes, I agree with you.

Theoretically, we have four combinations: EFI+ACPI, EFI+FDT, 
non-EFI+ACPI,non-EFI+FDT.

Now, for LoongArch, EFI+ACPI has been used on Loongson-3, and 
Loongson-2K being an embedded product, EFI+FDT is a more suitable way. 
They are both relatively independent. So I don't see this as a violation 
of standards compliance, nor does it add to the maintenance burden.

Binbin

