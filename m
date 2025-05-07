Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFB1E7648
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610357; cv=none; b=V3TBBVnB2giKqlFTV/Y0tOjf8B/0iC1zJ0hVSfU+2SFsHLzjK4PhrCoVvkciLjQ0YzCmKEUNh6Vf26MDe8FimU51BnwmZxRde3uZVmdGBc8jn+pLDpO3dGpSRgI84703Oxjmfo7berbZl+ElBV7u8yIJDwFWF20YMBQvtIkAixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610357; c=relaxed/simple;
	bh=+dcoGM/MPnQ7gR2bwDmEC4W4glqMT6D4Z27/zHMAu6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=X0deuuAbzBam829lISnVO9AlIPmjKlrLJMZrAlEZNncXjEaMiwqWmsn/mMDDd69dLTKO0woRbaIFl/lfCtpOF1CYUE8eBqVsgyMy1OG6PzwpYL/6yXIxQ6+JFcHd2t9IAWlyELBo2P8eea25DLc35iNMprsStt4T8nyUzp6CZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XTR6XmVp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XTR6XmVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746610353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89g+uUbAmI4s1rHApPcoGavOskeIK/6Orkxfvy6zQ+0=;
	b=XTR6XmVpWa4wZxSIc0nJI2ItHsT5JkZXjc92gyUPWAJ6ptdKrhEDqFKC/7KHet4l0HxFga
	PlExHDks005c5vYQAfzAZwWplMPwQSGZpKvllUs4wTg2Ep2WnNBVx03OGznWfq45yjVsDB
	jMCULBqfPjV1HnJpiUZCfS7SLvUiBuE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-rtiJ8MwMMfyIf1oZcbBLQQ-1; Wed, 07 May 2025 05:32:32 -0400
X-MC-Unique: rtiJ8MwMMfyIf1oZcbBLQQ-1
X-Mimecast-MFC-AGG-ID: rtiJ8MwMMfyIf1oZcbBLQQ_1746610351
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso536547766b.1
        for <loongarch@lists.linux.dev>; Wed, 07 May 2025 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610351; x=1747215151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89g+uUbAmI4s1rHApPcoGavOskeIK/6Orkxfvy6zQ+0=;
        b=HKT4qx77jkweIGnD7KOfxm+3DgaqoBc1I/bImejgtEDcqJvjEm+K6a9ffZ1Z+8f3HS
         4wRKSsEHQnsClZOuh9iH+b8qrr9FWS2RGFgDZxLRt0qL62+teUlLiIZ42tsZVEPdoZqu
         0OOsBdpodz4VfdPMir//S4nl/J65LhZRKW4VBkTbUEZgTAnVNPtDnyKSvJh6Ra0k0uv/
         2uMHevse3X0jgunsa/Ii/w9FCQ1rIjHlJ5PH2YnOojGOl9hQrU/cy4BPk9o7kyiEO5TK
         bN2v1KzuCg1/x6ERaKu4W7HP+Gew7Ghkx0E+r9u/zMlcgpFULcJ1KFZNZ8phMKwU2uLW
         kMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBVBPkK8IkMqkBGK59LNnsGGXF0AV4IKDsg8NzBJTfR8vdZizJScwZf4CIhWX5CIh+3O0yM/UdNxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqIK95vgHAPAloUAXiWnAxYeGmGZY3/joIGVrTxpaucqnLJjye
	iQdEu6099r08BxQqgg7wJSat1LOp2Isitl6O92sFf8tYlDRQoxvEgdNu4w2Lo9/ocCcfPCCho97
	RtJ+2af4XFVcgqT6b+EMhiGFy5GEMyNqvyt5hHBbu6iNw5jrSWw7ZbDfuCIIO268tuA==
X-Gm-Gg: ASbGnctmX0DflcyXCE+aZTM9HUaiZwOPBHfmto4Sp98/zy78pgLDbWtbZUahAW7pb1e
	lyP4bU15BKEUKX129pd6oj3NxuN/aI8R6FKJ6KD/v0o6CN+X2CIglsy1J1goxyHiaKCK9Ia3SUg
	y+56tAXGE1E+aPq15sF3acq9hH2dno5+MZUdPBxP+rHaK5opU+v7YKaCqrFh74ktNuDixQEyZ/6
	BeLO87qRePusJi+Lb4cSwsvet0fI8kuF9WgEridZjDvqpabtusMjcsQwcAeIVcDzR1QnA2ArtPA
	1UjIFWNIm2/H83dY
X-Received: by 2002:a17:906:d54d:b0:aca:9615:3c90 with SMTP id a640c23a62f3a-ad1e8d0ba2bmr267000966b.52.1746610350920;
        Wed, 07 May 2025 02:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB9GITuMuYoSYN8HyavQFo2/J56H0NB7QS0JaWBQv+IFH3p+ygglDzNeMYFn+SDDKrajLukA==
X-Received: by 2002:a17:906:d54d:b0:aca:9615:3c90 with SMTP id a640c23a62f3a-ad1e8d0ba2bmr266997766b.52.1746610350328;
        Wed, 07 May 2025 02:32:30 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.165.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm869562066b.1.2025.05.07.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:32:29 -0700 (PDT)
Date: Wed, 7 May 2025 11:32:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, 
	peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de, Yinggang Gu <guyinggang@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v9 4/5] tpm: Add a driver for Loongson TPM device
Message-ID: <CAGxU2F6m2=+07sUoy4PKVs1vMR6Yr--pgkOG3SEGg8gi=HRf+g@mail.gmail.com>
References: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
 <20250506031947.11130-5-zhaoqunqin@loongson.cn>
 <2nuadbg5awe6gvagxg7t5ewvxsbmiq4qrcrycvnrmt2etzq2ke@6oyzavctwrma>
 <0b148f09-d20d-b6be-d31b-6c8a553658c9@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0b148f09-d20d-b6be-d31b-6c8a553658c9@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9P-T_SB_1nLtIkuSgXMomZXlrz0MhDBxGOSvhXwaC_I_1746610351
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 7 May 2025 at 03:35, Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>
>
> 在 2025/5/6 下午10:13, Stefano Garzarella 写道:
> > On Tue, May 06, 2025 at 11:19:46AM +0800, Qunqin Zhao wrote:
> >> Loongson Security Engine supports random number generation, hash,
> >> symmetric encryption and asymmetric encryption. Based on these
> >> encryption functions, TPM2 have been implemented in the Loongson
> >> Security Engine firmware. This driver is responsible for copying data
> >> into the memory visible to the firmware and receiving data from the
> >> firmware.
> >>
> >> Co-developed-by: Yinggang Gu <guyinggang@loongson.cn>
> >> Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
> >> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> >> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> >> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >> ---
> >> v9: "tpm_loongson_driver" --> "tpm_loongson"
> >>    "depends on CRYPTO_DEV_LOONGSON_SE" --> "depends on MFD_LOONGSON_SE"
> >>
> ...
> >> +static int tpm_loongson_recv(struct tpm_chip *chip, u8 *buf, size_t
> >> count)
> >> +{
> >> +    struct loongson_se_engine *tpm_engine =
> >> dev_get_drvdata(&chip->dev);
> >> +    struct tpm_loongson_cmd *cmd_ret = tpm_engine->command_ret;
> >> +
> >> +    memcpy(buf, tpm_engine->data_buffer, cmd_ret->data_len);
> >
> > Should we limit the memcpy to `count`?
> >
> > I mean, can happen that `count` is less than `cmd_ret->data_len`?
>
> Hi, Stefan, thanks for your comment.
>
> Firmware ensures "cmd_ret->data_len" will be less than TPM_BUFSIZE,  so
> this would never happen.

I see, but I meant the opposite, if `count` (size of `buf`) is less than 
`cmd_ret->data_len`.

I mean, should we add something like this:

	if (count < cmd_ret->data_len) {
		return -EIO;
	}

I see we do this in other drivers as well (e.g. crb, ftpm), so I'm 
trying to understand why here is not the case.

Thanks,
Stefano

