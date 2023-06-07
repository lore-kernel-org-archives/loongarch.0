Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2658F47
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:18:04 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8BxLutKS4Bk5xYAAA--.385S3;
	Wed, 07 Jun 2023 17:18:02 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMpIS4BkSjYEAA--.6544S3;
	Wed, 07 Jun 2023 17:18:01 +0800 (CST)
Message-ID: <ec543e3f-8e68-5c02-ad89-fa9a72883112@loongson.cn>
Date: Wed, 7 Jun 2023 17:18:00 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 0/4] Add Loongson HD Audio support
Content-Language: en-US
To: tiwai@suse.com
Cc: perex@perex.cz, chenhuacai@loongson.cn, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <cover.1686125797.git.siyanteng@loongson.cn>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <cover.1686125797.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTMpIS4BkSjYEAA--.6544S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1rZrW7ZF43ZF43Cw45Arc_yoWkArgEy3
	ySqFWkCFyUG3Z7AayIyrs5JrZxXayUA348G3Z3tr48Xanayrsxtr4DCr13ur1xXFn5Gr15
	Xr1vgr4rAr12qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOF4_U
	UUUU=


在 2023/6/7 16:51, Yanteng Si 写道:
> v3:
> * Adding some comments.
> * Seting polling_mode flag.

I'm sorry that I sent this patch series comments without indentation, 
I'll modify it and resend it.


Thanks,

Yanteng

>
> v2:
> * Handling with two new flags added to struct hdac_bus.
>
> v1:
> * The Loongson HDA controller is compatible with High Definition Audio
>    Specification Revision 1.0a.
>    See <https://loongson.github.io/LoongArch-Documentation/Loongson-
>    7A1000-usermanual-EN.html#hda-controller>
>
> Yanteng Si (4):
>    ALSA: hda: Add Loongson LS7A HD-Audio support
>    ALSA: hda: Using polling mode for loongson controller by default
>    ALSA: hda: Workaround for SDnCTL register on loongson
>    ALSA: hda/intel: Workaround for WALLCLK register for loongson
>      controller
>
>   include/linux/pci_ids.h     |  3 +++
>   include/sound/hdaudio.h     |  3 +++
>   sound/hda/hdac_controller.c |  5 ++++-
>   sound/hda/hdac_device.c     |  1 +
>   sound/hda/hdac_stream.c     |  6 +++++-
>   sound/pci/hda/hda_intel.c   | 20 ++++++++++++++++++++
>   sound/pci/hda/patch_hdmi.c  |  1 +
>   7 files changed, 37 insertions(+), 2 deletions(-)
>

