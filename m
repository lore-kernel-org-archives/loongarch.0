Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C54FCA40
	for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 10:38:15 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8DxPOuV98BkzC8KAA--.20221S3;
	Wed, 26 Jul 2023 18:38:13 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCOV98Bk46c7AA--.10453S3;
	Wed, 26 Jul 2023 18:38:13 +0800 (CST)
Message-ID: <02a0fd6c-16f6-26f4-b374-197f0a017a5f@loongson.cn>
Date: Wed, 26 Jul 2023 18:37:26 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: loongson: mark OF related data as maybe unused
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, kernel test robot <lkp@intel.com>
References: <20230726070648.700754-1-mengyingkun@loongson.cn>
 <174b4c41d10fa1b31821482ec737733ca4633464.camel@xry111.site>
 <1ad985f9-2738-8b42-a8e2-c2312ec57d9e@linaro.org>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <1ad985f9-2738-8b42-a8e2-c2312ec57d9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLCOV98Bk46c7AA--.10453S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAEDGTAnS8ElAABsO
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF4fZF4rArWUCFWUGw17urX_yoW3ZFcEga
	yUurn5Gw13WF97Ka9FgFWUArWDKa17JF15Kr18Ww4F93s7tFWfCFZ5Zryfu3Z29F42gF13
	Ww4Fq343ZrnIyosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU


On 2023/7/26 16:05, Krzysztof Kozlowski wrote:
> On 26/07/2023 09:20, Xi Ruoyao wrote:
>> On Wed, 2023-07-26 at 15:06 +0800, YingKun Meng wrote:
>>> The ASoC Sound Card driver can be compile tested with !CONFIG_OF
>>> making 'loongson_asoc_dt_ids' unused:
>>>
>>> sound/soc/loongson/loongson_card.c:200:34: warning: unused variable
>>> 'loongson_asoc_dt_ids' [-Wunused-const-variable]
>> Hmm, why not guard the definition with #ifdef CONFIG_OF instead?
>>
>> Source text is first and foremost for the human reader, not for the
>> compiler, and an ifdef clearly shows the condition when the definition
>> is not used.
> Rather drop of_match_ptr so this can be used also on ACPI.

This is more reasonable.

Please ignore the the patch，i will resend a new one.


Thanks,
Yingkun



