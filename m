Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7526158C
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777266485; cv=none; b=di2nX56gY6rOC6V1A7VOqYs73LiV0Ytvv5ppG3JIDqRDY8ZpZoxZ6A8k5LvjERlig8d5RceiqozhDXLRH3snOUSdfuQRmHXmPC6W8EMiFgwJSDoYaNDdQxuZPyy8vC5dZ1OunwXh5h3xTGbung/bqBrNRr5kEi6/ayZaP7dkWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777266485; c=relaxed/simple;
	bh=Ii5NbXhUOQjRzp2VMCJFnmnZXxbX4WVN0w5DvDdGOSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRQ3dcZC9PRgyYp6sRYKMGqf/EBjygsAF4cKWDuKe878Z+FyooOYAuICBRuESkKnKXendQIO3pq565e806pn3pJKb4OEca8iVc3rvrpcD24i2zIUsNUFGTH1t0Bv2MuRThIbD5AUOiaAw6O9yXbxM6gVGSeval6lyRhypKMRJBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b=J9fpTEuW; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b="J9fpTEuW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6407172a12.0
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 22:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20251104.gappssmtp.com; s=20251104; t=1777266484; x=1777871284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwuwd6uQq2G2p2tYzSTcZy6RNVRfyJhVgbCJbdY0nXA=;
        b=J9fpTEuWzniCCaXY817Z9kChlUpl51fRPfMs1c539nNR1/XB/sH7ur9m7Ng90vGr7z
         LVRG7vBc+jHkWXGHvPy0EKXw1ywxNgEkcaLJEXMH8Fs8K7nvjchbtFI9YkQrGe5I4sLP
         5FUW3qGMdEwmWI3V8qWY3t45ldY/VhOe6CA+m9i8xlthKvz7+G4U5/YkZgp4cMQzDyq1
         kn4QlsfBc5twPwvbQuFUEWbsKHKt9OkmpdRkaXcxiMiahaXNze6GvajVkWdSgpXO1Z3D
         ngudNr3E47wt7X1rORDNlyzlhy8euefI7Q7Bj3utjzryGPsKu+UHUR/XzHswSRU+16Hn
         lDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777266484; x=1777871284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwuwd6uQq2G2p2tYzSTcZy6RNVRfyJhVgbCJbdY0nXA=;
        b=q4A69u7TTq3UBQmjpdfKKkA69iLrFaIMW8hAa/8LVKjXL/bwslLTkyhgGDOu7Ll44o
         +wU/H3+7FStXKuqMLnemE6wZHFold67ffbg0nge5VzACp38LT9CAYYA4HmF+9oOzUrVo
         Q1m0KazusHf+G0EyR7BA9B7XDSVorLpkN1NPOWiqivmBc+hEMWGCGEC4FR4//+cKIxV5
         TRSr31PFYppxBZVtyt8f+P7kylh0VdEaT7K5d8FGjokDx9ZGh/HBWDyd/Y8MS0O9JOsp
         UFKYfcrl4HuMOXC2ofChs9qzVp/iLcagd/R3dZNc1+EGkKGz3o7NHRrUsJWKOwxyK6nh
         KJeA==
X-Forwarded-Encrypted: i=1; AFNElJ+g/kiJt7QODEMM1isPdX5IEw9Zw5MYOucp+5hQWSt6Tp0h9BwPDFov87UJ0YwUoZz87Z40kBet9i8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHRxKAu9Lw2xyYbTCjrgY0mvsj+kdlB0pBcOQeAwlbS+gNXcjV
	CKhFpJ2UBB/uxuIvILjTweHNIPlmtyceBsonT/vqBJql3ARSrswcJ3b90GnmtA/smWA=
X-Gm-Gg: AeBDieuBBkLCTiTa/giA8g0tbqpt+Pf8nxT5Der/i4cTZLOHPbpkd10kkZt9z8eNP5d
	PYkTzHZc0WBeLRFj2rqmQsMTQhGxTUnADztwnB7bdKUu1fixINceI9F0lIQRjj52JCXkGi2qiRx
	8GDH20ARMF1i6IfgQuK6zN6/0/D13REu4c+JneQJuC9De4VmNybaaXX7GyqS/qcaS189zemECGt
	Way2yo+KWDRC1Jn+YT+WDVP+uSqOxOWCWcJh0gwi+PkR8UjBudglbVTqcGDFUDj0MgrbdfYn9NR
	8OUXJg4Py6j3XUJYzEH784l7j5xxmItmCgJFytastdAtDKEfV08gNC34ScxB3DNCnorAbS0V7xR
	g2yq/XxWk2tlptl6sB63yKZv158GzBYBuKuEepGkF0OnHJjHU6JeXn7JTkoLa34nYNEjjUFQLh6
	trTpfFKwbawamj/r8eC5vDl89O7C6rwzSGxyZ7YGub/KXp5Y+T8WnBP46TYekOOxxZVj/A5B4O
X-Received: by 2002:a05:6a21:339a:b0:3a2:f2b1:1aa with SMTP id adf61e73a8af0-3a2f2b12e24mr31389145637.42.1777266483815;
        Sun, 26 Apr 2026 22:08:03 -0700 (PDT)
Received: from bytefly.. (139-162-71-225.ip.linodeusercontent.com. [139.162.71.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f3e5sm24293048a12.5.2026.04.26.22.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:08:03 -0700 (PDT)
From: Lisa Robinson <lisa@bytefly.space>
To: r@hev.cc
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	ilias.apalodimas@linaro.org,
	kernel@xen0n.name,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lisa Robinson <lisa@bytefly.space>
Subject: Re: [RFC PATCH 2/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Mon, 27 Apr 2026 05:07:35 +0000
Message-ID: <20260427050735.3410-1-lisa@bytefly.space>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426120231.532644-3-r@hev.cc>
References: <20260426120231.532644-3-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rui

> diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
> index 9825f5218137..80ba7d69e1b3 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -38,6 +38,21 @@ static efi_status_t exit_boot_func(struct efi_boot_memmap *map, void *priv)
>  	return EFI_SUCCESS;
>  }
>  
> +unsigned long efi_get_kimg_kaslr_address(void)
> +{
> +	unsigned int random_offset = 0;
> +
> +#ifdef CONFIG_RANDOMIZE_BASE
> +	if (!efi_nokaslr) {
> +		efi_get_random_bytes(sizeof(random_offset), (u8 *)&random_offset);
> +		random_offset ^= (rdtime_l() << 16);

random_offset &= ~(efi_get_kimg_min_align() - 1);

> +		random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
> +	}
> +#endif
> +
> +	return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> +}
> +
>  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
>  		efi_loaded_image_t *image)
>  {

--
Lisa
