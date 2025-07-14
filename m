Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0422718D
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483362; cv=none; b=Fk0zwUaTV2ajtExaFRg9yGMu9SYNoD92/vzDwvDpFGPHA339hIQ2BRVTLnXogdSY8FVrg6SU1nKhH5EZVW1W9LYcdGHUBEaEbvYIobOHd5fcT0WwsLG5erh83IfOCI/WWp6fw1RNIaINfgQDdRe3lIf9Y+Ljwn4bpk5IJjqmTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483362; c=relaxed/simple;
	bh=20+iTJmbXbYoI8B4eBq6ui+ltbUtnqon6F6dG60f0f4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LGGAfAHAode1fMFVqKZt4CqLiKsUfcxoZylSdahzhY/+wRdo0JtonFQWqyCLvQnXkcm3wxyBMDVeXlVrpx8rX6dUn8u0xDhgVdYVMYIG3O0/Ek7RF9g+bSRLnD8ig46PzfOgUysdulLu6DyPMHBCVBf5MlaZwaC1WsRcspuEnn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxGHEbxnRotx8pAQ--.23552S3;
	Mon, 14 Jul 2025 16:55:55 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxvsEZxnRol5cWAA--.17732S3;
	Mon, 14 Jul 2025 16:55:54 +0800 (CST)
Subject: Re: [PATCH v3 0/5] Support trampoline for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>,
 Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 hengqi.chen@gmail.com, martin.lau@linux.dev, eddyz87@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 kernel@xen0n.name, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, guodongtai@kylinos.cn, youling.tang@linux.dev,
 jianghaoran@kylinos.cn
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <CAAhV-H5EWp+h0R=YuTivEZEK0diDT+U2u--RPdhtYYr_KB4Z4Q@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f30ebf97-0ba6-41cb-5fda-8972f1a0223e@loongson.cn>
Date: Mon, 14 Jul 2025 16:55:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5EWp+h0R=YuTivEZEK0diDT+U2u--RPdhtYYr_KB4Z4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxvsEZxnRol5cWAA--.17732S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4c8EcI0En4kS14v26r126r1DMxAqzxv26xkF
	7I0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r
	1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU82g43UUUUU==

On 2025/7/10 下午3:29, Huacai Chen wrote:
> Hi, Tiezhu and Hengqi,
> 
> Could you please pay some time to review this series? I hope it can be
> merged to 6.17.

With the patch #1, #2, #4 and #5, the following related testcases
passed on LoongArch:

sudo ./test_progs -a fentry_test/fentry
sudo ./test_progs -a fexit_test/fexit
sudo ./test_progs -a fentry_fexit
sudo ./test_progs -a modify_return
sudo ./test_progs -a fexit_sleep
sudo ./test_progs -a test_overhead
sudo ./test_progs -a trampoline_count

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

