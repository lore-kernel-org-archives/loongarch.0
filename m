Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EA013635E
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756346481; cv=none; b=FSrLSukjyhVT7ftKcFKRo65rPcTe3ODYfeSk3D7S2YpZy3UHradnm8NjGBk2mB2sWxskw2Ye9tV1R6o8EDE0RY/DaxmKPDRdcAvusDl2962/lOYWt2NPlPEHFepJ9W+kMgSh6Lr9dNKpLIBH4NrXcb6e1s0VuT5Cd7zL1P72tQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756346481; c=relaxed/simple;
	bh=TigdDZ2vjd5XAmkE43dn0B8bK1m3zMpqhjPGZHh0N1g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aSINb96vA8aBPHPZyIncxUoxmzIOyapAXNOw3nI18fCM7dLFBM+55VHtR7BxfJWSQRnxhvSZOLXGLejO0z6NX48GY8oAhvG3sr7WTKAjWVyw7i2G0Y+7ZpgPs1hyk4/oXme07I7cmVDJSHyLn+gMVDajPP97Mj5FmneO6ADUBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxztJpuK9o8AEEAA--.7937S3;
	Thu, 28 Aug 2025 10:01:14 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxZORouK9ov3ttAA--.12568S3;
	Thu, 28 Aug 2025 10:01:13 +0800 (CST)
Subject: Re: [RFC PATCH 1/2] objtool/LoongArch: Fix fall through warning about
 efi_boot_kernel()
To: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250826064631.9617-1-yangtiezhu@loongson.cn>
 <20250826064631.9617-2-yangtiezhu@loongson.cn>
 <CAAhV-H5wW_04NHQ7z+SCPb6-T5Hc__n+x=ykg-u9vn4b4GXuww@mail.gmail.com>
 <487a8149-6cbe-46a7-6771-66aef0045f07@loongson.cn>
 <CAAhV-H7m-BSqajDiDNMNEq4FY9uoCd9LZySOe0VQ+2Sv1wZZVg@mail.gmail.com>
 <xyrcgkl7ud5pgh4h5yjyejz646bc22fnnwxahaoafqvnqintf3@mdhtfaybai67>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f2604180-3416-9ee4-9617-6939199879e4@loongson.cn>
Date: Thu, 28 Aug 2025 10:01:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <xyrcgkl7ud5pgh4h5yjyejz646bc22fnnwxahaoafqvnqintf3@mdhtfaybai67>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZORouK9ov3ttAA--.12568S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFWxuw1rGryUtr45GF1rGrX_yoWDZrbE9F
	ZruF47Kw4fWrZ09w43Gr4rtF98tryUGr98ZrWDXrs0kF15XFZ8Kan7Kr1kZw1Yqa98A3WD
	Krs5AasFqFW29osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOa93UUUUU=

On 2025/8/27 上午7:39, Josh Poimboeuf wrote:
> On Tue, Aug 26, 2025 at 09:03:34PM +0800, Huacai Chen wrote:

...

>> Then I think objtool needs to be improved to handle this case, this
>> problem is not arch specific.
> 
> Yeah, objtool should really be ignoring this code altogether.  On x86,
> that's not a problem because the EFI stub code isn't linked into
> vmlinux.o.  It gets linked in separately:
> 
>    $ git grep vmlinux-libs
>    arch/x86/boot/compressed/Makefile:vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>    arch/x86/boot/compressed/Makefile:vmlinux-libs-$(CONFIG_X86_64) += $(objtree)/arch/x86/boot/startup/lib.a
>    arch/x86/boot/compressed/Makefile:$(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
> 
> IMO, the proper fix is to change the loongarch build to do the same.
> vmlinux.o is intended to be proper kernel code.

Thank you very much, that is to say, these EFISTUB functions can be
ignored by objtool, I will do it.

Thanks,
Tiezhu

