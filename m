Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0945E2BAF9
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 03:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507933; cv=none; b=MiS2YViklcyvIlrGu0HEQfw0tWtn4yUWLFVuUab8+jrIdmSunYkVtCZithD30oDVl44+RWsHk/f713bvSPmleD//0Qy0N2O4S6BTNFtVAHGQFe6uAjjYhLGReBr8Ngfi0ljrPmumBmXYWGhk5jYUjy3XCs0aBXlqNJNsL3aH0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507933; c=relaxed/simple;
	bh=paV30tmBQ4OPLfvlJfySaEiQjyszop1XYt/9KmhleTM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BSvEvoozGjFkEy3rPQRKItzUUO5BCiEqfL90rJ9O/ygg2LnrEisMbclniysQCPdk0i8Hz6a7AQgZudssJjxFgaETIq+jwLIex8MqUY/Nn8Z7WVJhn9+p0mJQxiwkKYVxOzOcSI2VtVPULOS+BUkFXDwzDBhoBjp1MxZgMbPW6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxPJtWKdlmCfcqAA--.57422S3;
	Thu, 05 Sep 2024 11:45:26 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front2 (Coremail) with SMTP id qciowMBxjcVTKdlmrHwGAA--.18343S3;
	Thu, 05 Sep 2024 11:45:25 +0800 (CST)
Subject: Re: qemu direct kernel boot on LoongArch
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
Date: Thu, 5 Sep 2024 11:45:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZtkhtxcJUK-JediY@zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMBxjcVTKdlmrHwGAA--.18343S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Wr13WF48Zry8KF4xXr13GFX_yoWDGrX_ur
	na9F1DZ398Ar1UKwn8KFy5Jrnxtr1Yq34kt348Xw4kua48AF4kJ3Z5ur9Fq3saqFyxArZx
	uw15ArnFvryYgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJU
	UUUU=

Jason,

With the latest qemu 9.1 version, elf format booting is supported. Qemu 
9.0 does not support it still, here is example command line.

./qemu-system-loongarch64  -m 4G -smp 2 --cpu la464 --machine virt 
-serial stdio   -monitor telnet:localhost:4495,server,nowait -kernel 
/root/linux_larch/vmlinux -initrd ramdisk  -append "root=/dev/ram 
rdinit=/sbin/init console=ttyS0,115200" --nographic

Regards
Bibo Mao

On 2024/9/5 上午11:12, Jason A. Donenfeld wrote:
> On Tue, Oct 10, 2023 at 09:12:46AM +0800, maobibo wrote:
>> Thomas,
>>
>> Thanks for reporting this issue.
>>
>> It is the problem of QEMU for LoongArch system, QEMU does not support
>> booting vmlinux with elf format without UEFI bios now. We will add
>> support to boot vmlinux directly on QEMU LoongArch side.
> 
> I ran into this same issue when trying to boot my test kernel for
> Ruoyao's recent vDSO getrandom work. Is this something that was ever
> addressed on the QEMU side?
> 
> Jason
> 

