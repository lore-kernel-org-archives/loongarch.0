Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E69E1F0994
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 01:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267019; cv=none; b=KB1lZJ/eADnvk+D5PCYtZz2N0gLJMNQhIM88xyU6OULJMT+JupGoQ8+KPRIde7+08CCkK9jbdNFBpNXK0I4Qdp4w6gQd/Hu/TyK9Me8Mz9X5wioR4uPgyXXRuSVgaEpPPVg4+4mjbmUr9rSJW6QbzlI/m24YmXaSKs2gWkooh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267019; c=relaxed/simple;
	bh=VVGUrqfODIjjT0y9p1rLLUWdxVZVunuVyGUrGB22CS4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DcakseD+Z+ajp6Wg61IIcMOUGTildMMtZ/rPPTATDXp/pdmpletcsDEClLcfUerlHvHLCPhvhdyyXrHTN2oCt7mD/OxbLHowgJEEInZSJErjeVpHdXbvtoM+Wv449ci4c+V1ItRKB/oTfED4wCHa5ogEfpKEjRZVXcl2KNfezuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxDMMGnWVp6CYIAA--.26408S3;
	Tue, 13 Jan 2026 09:16:54 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxD8MFnWVpAVMcAA--.59322S3;
	Tue, 13 Jan 2026 09:16:54 +0800 (CST)
Subject: Re: [PATCH] Revert "LoongArch: Remove unnecessary checks for ORC
 unwinder"
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260112091531.12735-1-yangtiezhu@loongson.cn>
 <CAAhV-H6xLX5ZjVKV9bixN=PT6p47JheDU4pYtqeo-=2BSnQkRg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b1c56000-8669-04e6-0468-a5ff1fd611ac@loongson.cn>
Date: Tue, 13 Jan 2026 09:16:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6xLX5ZjVKV9bixN=PT6p47JheDU4pYtqeo-=2BSnQkRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxD8MFnWVpAVMcAA--.59322S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrJF48tw1UAr1kJF1kWr13ZFc_yoWxXFX_WF
	92v3srC3ykWr4Yka1DW3W5Zr93Xa1qkrWYga1DJw43J3s5JFZ8Kr95JFyfWF48JrZrtFna
	9Fs8Xrn3Zw1j9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUU
	U

On 2026/1/12 下午5:23, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Mon, Jan 12, 2026 at 5:15 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> This reverts commit 4cd641a79e69270a062777f64a0dd330abb9044a.
>>
>> The system can not boot normally with the latest kernel 6.19-rc5 under
>> different configs, commit 4cd641a79e69 ("LoongArch: Remove unnecessary
>> checks for ORC unwinder") is the first bad commit since 6.19-rc4, just
>> revert it first before finding the root cause.
> Can you show the errors in the boot log?

Please see the coming v2 patch, there are more info in the commit
message.

Thanks,
Tiezhu

