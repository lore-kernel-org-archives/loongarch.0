Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475405;
	b=Y53v/BvqlxEoUtv7DyC29SUgLRz8InPq4IF8w4FRj4rm3SJLfXk6nwBx7znZ04yI0+IX
	 wMjXWPRw8Y7a1gKgN72kgv3OPfnYckKc/T43aEQv91f3SX/n3ZXRaTGDiDbnawiZN84gt
	 AVoRpH5bpXEIQMJM6B3B/ZF/F/YGjPRIGsffM+C9vxJN15vAWnNgIgFVixOQHw4qsBiS0
	 Hei0xfH4KPnsLLjPsn5DUqdPe/0qIliTXEGQgNCXlg2LKe4SXPLo1tn5Qq7rrWztQiLOq
	 jbKk7xk2ll6LyP+PRwyVlJfMNtn1+hhsW0gS8+TEmsj0yOMhXIa6AijDADRw0r4mRPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:X-Google-Original-Date:Subject:In-Reply-To:CC:From:To:Message-ID:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
	b=wD3qhiKIO5h+/xc8jMwa9jtVX6+jo1vIj94a81fAZ1pGnEWxy2hqOHSLr2xjkWzPl2cs
	 uXNonUg1pJ+WvCIDZJC9RJQAg+BiD62SbNKehR4cjJXGkbkznnakugimQaa0y4k1uWf8X
	 hA4NTfz2Bzap0pzYaKzRZtHEK5vBq/JWhGjHFGHyikk7Qh1Pj+t38+SfUc7tce5D4pnLc
	 FZJc9vMCnkMdPe1+4f9t4gQYMlQSMosHweqyiqgF49io7AbvwjhpUCsS2q94/9nqyKyaV
	 BJYzNroXeNVU8UlJSNnrGJ78rh439kZslP17ucp2eFPbKPaLDcrwvwPq+MxjpH+ioew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dabbelt.com;
	spf=pass smtp.mailfrom=dabbelt.com;
	dkim=pass header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GXDolk9w;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED8606A32A
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 23:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76ED8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GXDolk9w
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3731939c88.1
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 15:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475403; x=1796080203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=GXDolk9w3kmfoKzBzkPuo+tgAzQ1YKftm6CqYBVveUU0nVKzefvw4oQQ4kErKYpdY6
         xx9bPYwz2kKyVxKjIfyRleG+PcpaE3ubw6j3I/KEuzYeLN2B6j+jvtODPY1grCRntMsG
         PTayzdSh1P6qi/qfrqlHxaYKMNdSnmAQL/LVzHO6bL1aeahhV8xOI3Bkq1MgCy2ogsyC
         UZnaSwekOousgjGG5xXu1WDwWqqTKn+NkUS4oB19dZMnCME4p+qh7mOIzCYbmLNIBO0w
         TiNlEVvbXN0dgwA5emSMUFVU2kqUoWpfynSw7GiQ1VD8ReOESWnlHAKU4jxON+QbvTSf
         EFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475403; x=1796080203;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=TbVp/YXeqjpv0M4hYanRioL9SOzOJYgPo+yWeQIVMYHGwdjxmcZdB3VACq0v754MKC
         W0OC/HnIVPQAG1fPVZMHUhyJxNkw2XPxWP0iMgicodQ5/SIsw2CinooVUWuryp/CCKp4
         JLRDjpRJWhKtWcX12FBd3jpr+9msuYoEY2tdtGUDavxGWylPXeHHz8dTZfq5PE+nSHa6
         GQtXm33Gs3o9xvoAi8HAJyMbQ9vZax0g15lmH4GNR4ddutBOVeVYvGpiNvw0Lv2ix/Rm
         rtF5YVlSIXEXZfcbL4pNCXI8iv6rItOVWbckkhi+YT5kNyZ9gQ1fhNuPjNtYHjbH9H4t
         38eg==
X-Forwarded-Encrypted: i=1; AL+hErH+0hXWihRZ7V5UlKNQetDUBV5Iyaky8VAOx6DO9Ds1L0M0uq1hhGd0Qk6ftatnT1SBCNsaCTZaF0M=@lists.linux.dev
X-Gm-Message-State: APuU4Z8s85OVNkyUJQbtAGM3FP/gf5OeJxMnkLsZce1w9BFAvm6ahPw2
	/2Yflq4VbdZ1g5Vr43fyWiHoFpXwFabNDih3Ls3St4DoRE7DeDlPt6UyJJRRrbvjekM=
X-Gm-Gg: AZFdTZd+f7WWWomf4nlNxuVakLGBFfthrCin5IFAAMHKQPgjCwnJgEq1sGetyLZRjQM
	iLWvmvrjfPeuFfjVhkQqUnJiLsW/dIkjnR3mmOKo3PDKvIK69IXKBMrQblEplCE19SYYYj1wf4K
	dWVqdK74VriJxklwUnRRdX8GWn8sa8/ssLgafZlGpvMnqiKKdDsf5HeDo9iv6bIhdfENDBPXUkY
	iJrQ4kvlJtRycVmV1qkKAap2Qdcxz9tJ+KI9w/kY8LJQMdqQFbotBbKE/tXoGbxlo0pPq430qUs
	rC0zzc3gokL+p/1G/ReTRUuY9P85TFy/5GLveCmu/nBRmigKXbr3Llgp8/8X27i3HAD5N0D2Oqb
	v5ftXB3OhYNxuQnTpzqS8hnCpxVnvqTesjaR24je0tKPgdc2KBUQJtJAVnRVTNbmNv9OOcqAdh+
	4bf2KeYIHUPLg6pe9dCBmTqWrqidDEwlq3G3cdZ0qdve2/q4O/kW1JjMV7OwEeVvaBtuY13Rzf9
	8jKDGHq9QZryclsMkN+93VavYfF5Xz8huhx3Rl3GUFoOOxpbVwGSYcnwJ4tHl6A3889TMoiop5A
	O2+v8Jkl2SgBnicn7m8pzPmbFa4/DGMJAtU526Rzd8u1zwwoY4pCMhBDvkv5yE9c6pU5vgHZqGa
	+Yj7egFZWpok79igO99RXzNGgK0U=
X-Received: by 2002:a05:7022:e0d:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b55668c573mr18309442c88.0.1795475403196;
        Mon, 23 Nov 2026 15:10:03 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm30075627c88.15.2026.11.23.15.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:02 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:02 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:00 PST (-0800)
Subject:     Re: [PATCH v4 02/19] riscv: Use _stext not _text to denote the start of kernel code
In-Reply-To: <20261118182105.1633603-23-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-EF917BD5-807B-4931-A0E1-AE1732E69C0C@Palmers-Mini.rwc.dabbelt.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Nov 2026 10:21:08 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text and _stext currently refer to the same location, i.e.,
> the start of the .text output section, which follows the image header
> (.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
> refers to the actual start of the image.
>
> On other architectures such as arm64, _text refers to the start of the
> image, and _stext to the start of the kernel code, and generic code
> (such as the EFI stub) may start relying on this distinction.
>
> So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
> resource that is exposed via /proc/iomem (and from which the "Kernel
> image" resource inherits its start address), over to _stext. This is a
> no-op given that both symbols currently resolve to the same address, but
> it permits _text to be moved to the start of the image, making it an
> alias of _start.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d79f99b86033..e6112d424fde 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
>  	 * child nodes.
>  	 */
>
> -	code_res.start = __pa_symbol(_text);
> +	code_res.start = __pa_symbol(_stext);
>  	code_res.end = __pa_symbol(_etext) - 1;
>  	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
