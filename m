Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CB3E92A5
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069982; cv=pass; b=feqO7Lz2WObpFFPvRSMVIQXUnTf33WBpBwKl8kMKTn4A7brykt5dnP2/4aeFTfkVchyg5IY3K/RxyJubS7n7JSwG1PJoTesVB5CcTB2hoXbEnfwzepUB9mcUdiRgIwDrauMp9VfZP3Ib8+Ow6aOLud2OD8GlFz11xTobS7RVB50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069982; c=relaxed/simple;
	bh=fLuSp4BQOyewEYwBHafvU3JRuCxXfIpO3ZfAxANNUtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3mrjhW+vegAC8+285gJdPC5r0SQBoh/jS+PKADTBrSNSEQ8iSDenG3tf7nAoC8CDXXGX2SJ8fdQGB1RWjqFmrtcdONMrntR90rbz7Vne56XbEfyNAwM2D6fFnCW5LNuNYprdhwt21Sbf7aUy5xEcNVEuZJ5MR/eCYY2zROZues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHedqOYm; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHedqOYm"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7b4ee3a88e1so136867577b3.1
        for <loongarch@lists.linux.dev>; Fri, 29 May 2026 08:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780069980; cv=none;
        d=google.com; s=arc-20240605;
        b=Qkw1T56LEAv5Q8zKtXA4qz8gNtR+v/Wd/z+HzRRDnlJS3kcOCc7uKzjQXcpCExHhX8
         FS7/qNoHNLSLRhO02Oax+sP3wasMo5NLnRDSrHBIjJHULMRzA8Etn9ykUfxCeYcgiJXD
         muRGCfjhxaujBEtTW1WGmT6IVX3eRprXdFcMnB+71+rBOiGCCw64l5SdslhX7qBcfgmt
         r8oc9YWoORMKr4uWv2GkUV05bThJjf6BxYvSjz8wGgLiaWSie62PEd/Fh96lYEBdp5n9
         i492wp97x/WEq9saq9o/xSno7LIXz8iOYRCOzYwW6sdkLWN94eD2J0ceE0G7KrtrLFww
         UQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=57StnsCKBoSeLVKaEyop0wRsybMM1RQpT6t9R/ontsM=;
        fh=+zmz4Dt+i6MV/TkUzn5Az+iCM3XWwL57jVw+lJGRJPc=;
        b=WwWsXeFpv3o2HhRWe1DrtkRIHsc3n3TWctCBVxKbY4DtGF5dNcN62ETw9qLFdWKrpH
         bEKx00ehRMjITUBtGyyflPgNKy2C7flI4FnnSmjqY6YOrR12iXY2fZzPOVRN67pMl1Xm
         OhWCZosQz+R3DoWo3kOMgY909+5iY08f6MhvbYgLlGkZ0Aaoas6r1MTOcYHAH7ns/Cop
         4PRgjEDvae9f2sLBAcJCQ0GfQ5O5Sks3sLuXasFsqn9HKwaRI4m1daTjqHJ+fqJ+SM+h
         pCwq5V8i3Ns5z+SjzVTlcuVL/3ksN2MCu4npv9Wb3IdHGjvk8JZvpYt9TA1wHX2h1hpG
         iAlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780069980; x=1780674780; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57StnsCKBoSeLVKaEyop0wRsybMM1RQpT6t9R/ontsM=;
        b=dHedqOYm5EmJV/1yCl5JjcntstTUlfM4DbPvEjUudV+0Kn/YhxaDLZCYiW9cRBKEDT
         tgj7/GAijLGQBlxQjWIw8OhvRxr1OaDB7gBBVUCSFbEAoIGy+k+Z9EwZ0WM6oAnPwExB
         fkN9/89Gq1GO4ConLgKv7iwxrb8lvhZStvo0qPQ/tVpO0x66F9+bzNvAy/EPQ5fsrUbG
         eUoLyzAJraJq98jDh2zx7NncU7b89DnmC/nWMneWrs7QMT0gCx4QNdlJBsLurasvqqrV
         dhOLsdnMRvTLlTYn1TWjw50BZVdy3AaI1TbwHk0bTAketRtYqcbug5Q48cGPPbUaJ/op
         oHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780069980; x=1780674780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57StnsCKBoSeLVKaEyop0wRsybMM1RQpT6t9R/ontsM=;
        b=H0mbwNy928fP5xZcX/+3fhhQ+pBUbTOnUPN7njCmAHSM1lTbJmp+jF/0geXYYI27tC
         BetKwIVVwee6P0Mn1hlAdeVzheZf4pd+kScn610uDKq6s3v8uyIt8onToEc+GiAgyuT9
         NDEcMtzsTFEB4vren5IwaRDDA2ANmBv4Q1uPRSoamWPGfrSL9osDw3c5fGXW8vdtpMAb
         2yScoIEcarj3Du5mcthQgf8eFn4ckVtlxRQ+PfsMPaDmKvE2rmgZIPmek8H0VFkdh1iC
         QD49xsJEiAJ/jgc/xcL/N43RYeKObxDEkUW8U2mOiLWU++s5If1+9GUShBce2EGGwQYi
         JjNg==
X-Forwarded-Encrypted: i=1; AFNElJ8LI3P6R6daIQF8+agctg5bcIpUwL3D+4ZHZd2nj7x1M2AzSJnzhx310l8VRxOUf34WImKZ7ZdSK1s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4MJ8xdVasgyxciHIaAVjXrUREBvNRjsViEs+GvS4A2GtlCYUo
	kpagyHHRmkEb6stXougmClNkA5j2T4+oloTDpfLTZo3yFfkKuQnfDSKtPqm+fIzwgn9Ptd8JSKx
	xkfWQM4j7WeiTzV+nBqZYGceRtoKkKC8cKiXINF0BKg==
X-Gm-Gg: Acq92OHPwdpPnjnp+IYNGLRjePiOtyjABMdR0FrFAac4K5IOwQNqMhN8mxAyl23Dp8g
	jYmefzrSapHdShUD6Bj0sRE0ifMdei1+FiKUj8DA73+WPQSRb22flXYdzbP2uLCbjkjEKDiIcwg
	YxYe20FuJjilK9CeZMD3vFrVlughZT8rcKNRFcPzKQsVhMOhvBX0Bp/EHpyX+OKCI1yza1pOzM0
	eAiZdT+Wha00oJuIV2TJ1/g+1HbejcZArEtY6OvT5LTYZ0J9zaS1JQMXFB4LdmwRcZv+HzZj94s
	ucGslWiBpjUib2nruzbVpYoheXIoAGesIxY8D3LkpJtaaFnXIG/x+duzCQVr3JQc6LifQ4AAsdd
	s0A==
X-Received: by 2002:a05:690c:660d:b0:7bf:ff7:ea6e with SMTP id
 00721157ae682-7de47281fa1mr30969627b3.4.1780069979857; Fri, 29 May 2026
 08:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529140559.1775511-1-chenhuacai@loongson.cn>
In-Reply-To: <20260529140559.1775511-1-chenhuacai@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 16:52:47 +0100
X-Gm-Features: AVHnY4LSrZZZJMFoZaqPSIwMqmLiHzbsxYoMg4uqG_L5elx4hfTYE6ALISWkCME
Message-ID: <CAFEAcA_Li+07XNfE+GpvZOzwJReqbG=x8nz=kMrQy5vqkReEUQ@mail.gmail.com>
Subject: Re: [PATCH] fw_cfg: Add support for LoongArch architecture
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Gabriel Somlo <somlo@cmu.edu>, "Michael S . Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	qemu-devel@nongnu.org, loongarch@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2026 at 15:42, Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Qemu fw_cfg support was missing for LoongArch, which made some functions
> unusable in virtual machines. So add the missing LoongArch defines.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/firmware/Kconfig       | 2 +-
>  drivers/firmware/qemu_fw_cfg.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d8483..9ec747716389 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -121,7 +121,7 @@ config RASPBERRYPI_FIRMWARE
>
>  config FW_CFG_SYSFS
>         tristate "QEMU fw_cfg device support in sysfs"
> -       depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RISCV || SPARC || X86)
> +       depends on SYSFS && (ARM || ARM64 || LOONGARCH || PARISC || PPC_PMAC || RISCV || SPARC || X86)
>         depends on HAS_IOPORT_MAP
>         default n
>         help
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index 87a5421bc7d5..0c51a9df589f 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -211,7 +211,7 @@ static void fw_cfg_io_cleanup(void)
>
>  /* arch-specific ctrl & data register offsets are not available in ACPI, DT */
>  #if !(defined(FW_CFG_CTRL_OFF) && defined(FW_CFG_DATA_OFF))
> -# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV))
> +# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV))
>  #  define FW_CFG_CTRL_OFF 0x08
>  #  define FW_CFG_DATA_OFF 0x00
>  #  define FW_CFG_DMA_OFF 0x10

On the QEMU specification side we could probably nail this down
to "x86, sun, ppc, parisc have funny register layouts for
legacy reasons and all others have the 8-bytes-apart layout",
which might help to avoid having all this architecture-specific
ifdeffery changing for each new architecture, if that's
something people care about.

-- PMM
