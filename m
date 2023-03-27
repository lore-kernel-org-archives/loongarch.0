Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3733622
	for <loongarch@lists.linux.dev>; Mon, 27 Mar 2023 03:59:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8DxldiCFCFkdRoSAA--.32617S3;
	Mon, 27 Mar 2023 11:58:58 +0800 (CST)
Received: from [10.20.42.153] (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxib2BFCFkf8wNAA--.6983S3;
	Mon, 27 Mar 2023 11:58:58 +0800 (CST)
Subject: Re: [PATCH V1 1/5] irqchip/loongson-eiointc: Fix returned value on
 parsing MADT
To: loongson-kernel@lists.loongnix.cn
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
References: <20230324060854.29375-1-lvjianmin@loongson.cn>
 <20230324060854.29375-2-lvjianmin@loongson.cn> <87h6uagnzo.wl-maz@kernel.org>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <cfc7fd9f-67cf-3140-0ec5-a240a45506b9@loongson.cn>
Date: Mon, 27 Mar 2023 11:58:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87h6uagnzo.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxib2BFCFkf8wNAA--.6983S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZFWUGFyxWF4xur4UJw15CFg_yoW5ZFW3pa
	y2qFZ8tr4rt34xCr92yr1UXr1rZwn3uayxtrWrGayFvr4DCry3JF42ya1jvryIkr4UGF42
	vF4Yqa15uw45A3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU



On 2023/3/24 下午11:36, Marc Zyngier wrote:
> On Fri, 24 Mar 2023 06:08:50 +0000,
> Jianmin Lv <lvjianmin@loongson.cn> wrote:
>>
>> In pch_pic_parse_madt(), a NULL parent pointer will be
>> returned from acpi_get_vec_parent() for second pch-pic domain
>> related to second bridge while calling eiointc_acpi_init() at
>> first time, where the parent of it has not been initialized
>> yet, and will be initialized during second time calling
>> eiointc_acpi_init(). So, it's reasonable to return zero so
>> that failure of acpi_table_parse_madt() will be avoided, or else
>> acpi_cascade_irqdomain_init() will return and initialization of
>> followed pch_msi domain will be skipped.
>>
>> Although it does not matter when pch_msi_parse_madt() returns
>> -EINVAL if no invalid parent is found, it's also reasonable to
>> return zero for that.
>>
>> Change-Id: I4d278534999ec3e5c8db6d40155ba2665d9de86f
>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-eiointc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>> index d15fd38c1756..62a632d73991 100644
>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>> @@ -343,7 +343,7 @@ static int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
>>   	if (parent)
>>   		return pch_pic_acpi_init(parent, pchpic_entry);
>>   
>> -	return -EINVAL;
>> +	return 0;
> 
> Why can't you detect this particular case instead of blindly
> suppressing the error?
> 

For dual-bridges scenario, parent handle for pch_pic IRQ domain will be 
set by acpi_set_vec_parent() during each eiointc initialization. And
the parent handle for one pch_pic will be set during *first* eiointc
entry parsing, and the parent handle for another pch_pic will be
set during *second* eiointc entry parsing. But two pch_pic entries
will be parsed during each eiointc entry parsing, so a NULL parent
pointer must be returned druing first eiointc initialization, which
is reasonable and should not be treated as an error.

The calling stack of pch_pic_parse_madt (where acpi_get_vec_parent is 
called to get parent handle) is like this:

cpuintc_acpi_init
   acpi_cascade_irqdomain_init(in cpuintc driver)
     acpi_table_parse_madt
       eiointc_parse_madt
         eiointc_acpi_init /* this will be called two times 
corresponding  to parsing two eiointc entries in MADT under dual-bridges 
scenario*/
           acpi_set_vec_parent /* set parent handle for one pch_pic 
during first eiointc entry parsing, and set parent handle for another 
pch_pic during second eiointc entry parsing*/
             acpi_cascade_irqdomain_init(in eiointc driver)
               acpi_table_parse_madt
                 pch_pic_parse_madt /* this will be called twice because 
of two pchpic entries, and only one valid parent handle will be returned 
from acpi_get_vec_parent() during first eiointc entry parsing (another 
parent handle is not set yet), so a NULL parent pointer must be returned 
during first eiointc entry parsing, which is reasonable and should not 
be treated as an error.*/

Thanks!

> 	M.
> 

