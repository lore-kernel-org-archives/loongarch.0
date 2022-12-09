Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D2E816
	for <loongarch@lists.linux.dev>; Fri,  9 Dec 2022 07:02:22 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx7+t73ZJjxVoEAA--.10241S3;
	Fri, 09 Dec 2022 15:02:19 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxr+B43ZJjXAUpAA--.35622S3;
	Fri, 09 Dec 2022 15:02:16 +0800 (CST)
Subject: Re: [PATCH v9 2/4] LoongArch: Add kprobe support
To: Huacai Chen <chenhuacai@kernel.org>
References: <1670506868-15771-1-git-send-email-yangtiezhu@loongson.cn>
 <1670506868-15771-3-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H54yruHAe7ey8L9hHPonryEWEd8nt-iS6s7-odrDdrutw@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <37bc5ab5-ced8-cae9-9025-180154af0b11@loongson.cn>
Date: Fri, 9 Dec 2022 15:02:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H54yruHAe7ey8L9hHPonryEWEd8nt-iS6s7-odrDdrutw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Dxr+B43ZJjXAUpAA--.35622S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GFWxAF15JrWrCrykGr1Utrb_yoWxKFcEgr
	18Wr4kC34q9ry3Ka1UKa1rXFWUWryUWrWUKw1kCry3Aa4fK3s7XF4rK3sYyF4rJry0krsx
	AFW2grsayFyjqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	k7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxUcyxRUUUUU



On 12/09/2022 10:22 AM, Huacai Chen wrote:
>   cas
>
> On Thu, Dec 8, 2022 at 9:41 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Kprobes allows you to trap at almost any kernel address and
>> execute a callback function, this commit adds kprobe support
>> for LoongArch.

...

>> +       case KPROBE_HIT_ACTIVE:
>> +       case KPROBE_HIT_SSDONE:
>> +               /*
>> +                * In case the user-specified fault handler returned
>> +                * zero, try to fix up.
>> +                */
>> +               if (fixup_exception(regs))
>> +                       return true;
> Does here need to enable preemption too?
>

No need, because in this two case, after call fixup_exception() or
do_page_fault(), the original process will continue, preemption will
be enabled in the original process.

Thanks,
Tiezhu

