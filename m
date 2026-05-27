Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CC3BB13E
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866132; cv=pass; b=b++7GV58Aa5TDfxCr0lRdyfe+U69yI4dLNC9MqZcVTLiZNblOfNHVNWp0V4gx3EhzxyDoa+Y7TpRcEnI9rS/PTTLX7kdUQmQhj+0Bfof0sL/S3AWEZ9fq5QblkPCw0u6k0WG7HVKnAu01jckhNKA19UBS5IxqhdpOz5JNy80ZdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866132; c=relaxed/simple;
	bh=Hj3otYEBw5ZoFUlZ10nDzRDWKgiD9biTbeBS8Z9Xy7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujcoAJBL+VxeJicZsXfW8+VimVEwPYGekMdC7ftMt/zFdjPqkOpK8ARm4fECpuwD8tm2NAHI4rpSBxwL8OPh8fFJJEMhgL8FbPSOr5TIXouOdXl2PBa/zPD8XvRLMgvgIqYlj+xUx5on3WRNwN+J/C4ahj0wKfPObGSWvIxrpOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECsPShiN; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECsPShiN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bdd1986cc86so799016066b.2
        for <loongarch@lists.linux.dev>; Wed, 27 May 2026 00:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866129; cv=none;
        d=google.com; s=arc-20240605;
        b=evfATEJXKUbxQR3SyysmxVNmpqampoGNSozAuHNON649WljydNcBobWNfrnUz8Fn48
         8Vu66FjqmcedjXNm6eKoMZNbVYBQUgVTrmythnW27Vo9l3QJBLMwIF4ZiXIGLJMzlfdM
         32VEBgfA7Vgt8phDBkecY1UykwaFxWC2nbQtqSdGL3iNpq+aLuTjrdYQl3ihqAFgm1F0
         j7R7iYZSfHiqBJdZQHs5RzVcE7nmAMj9LtLbE1Wq67SJ7mZKhJAb7SmpG3aZ8n4lCAnJ
         2CLyf3bC6miXXTy/kZeYgNO3YBKAIkOi51uDTFuq7E9pkReSAHhH6ZgXK1L+dYfUxFZO
         cGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        fh=j849kmvr7ZCoZhhDGuVkAvx0H2ZD1jBQb7lNxtgb/XE=;
        b=M5JdnXVaBUgERgAkOZZaJcTkdemz0r3O4cRBPHDWwXiSnZTEN4wdSscd6FvyK6zUmq
         iMyzAD8bPZSU1okOjmsexx8MD1vN+fcIy3hAyAvwDxeQXaj9tsfMAMCmkmpLunKYhoNP
         xS5Qy/+Rl9GlYaC6/sv1I2Yta/FX+8gMpp+X1wWf+geJdINpZKFIYqIFtAS+KKUMNjBp
         li7scPfq7oF0L+A2IXjq5kUa/hvh4HkK5h2JF2QLnBlMZAcw07WMqJialFSjKAj88Xqi
         IQGOh+2q7Kdk2xBMdeISbztdWyXXgW7bTtyJ1amv1FvK8YINVbZmUDZHjmBjlWC14od4
         6FLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779866129; x=1780470929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        b=ECsPShiNmsMQ9K/FaHs3Rtz5NNNfmLYOY9iASA1SzqZt7hzLEADj4XWXukaYVWY2wU
         KUA46w0PfunXJqIctBnlMIOa8fHmEQooBLQy7+6/is3t6RMi2bZ7MBMF/UxqZ533uF5N
         DBLW0pE8FY8L7xD62pgEYvuPFSu0j+xE5TibjqH5P7gyUTtGsC1TqnPEYcw4/C64Hkbh
         Xs/zjpyAoM+J9hDw3PSSlhRzin3G9vR65cIgyH+T6Dd7x0xH7Y66Qu3lbTEwJBXG/DVN
         eamLXgGOzhBC4WzeQ87SLMuK06gjxTTV7nAqp3qZG6iqurhklqs7TgGeuMbQ8VqlF7l9
         u76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866129; x=1780470929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        b=S7pCz34AsgG4OAcvncwDniZf4yt8fXzeKhShFGy24p/HcoK4mdfOK9mDPFJe/smNas
         GMH7/OFHVUosciZZyyNeMoQGgaMs9C5Efc5WHFsOHwi/ITlTRyP5gUo71gsPe7nZ55dh
         T7diiP2FIhB2AbSCCm72Ih+RBKTHbMGzmRbdqUk3EMJhtM6rJXsNgYeiLtdxH1gGwWsp
         M4akryc3YlMOo8h7Tr2l9GqE/kannrOAhhziJOVbzYWSIaVdWkRGMEmn/lOgASjG2KHh
         arDeY/c8703dHjv7WhvPzR4wDfdkhlkWsxyzAqMDFE7bRq8v2cy+LxdqkzEOO97rF8v1
         d/Bg==
X-Forwarded-Encrypted: i=1; AFNElJ+wFVc3r8zSbT75FJYU08pr7epqfyF8E1vJ2U3VGt5QundydXEdTkEBWAwJWiRzUEMIMk8K+cXx8tM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnU6rBP+bSjIFm9AQjbLOKHE1I5cktDHXu3ZKArmgWb8WkCTtt
	ge4buyyvQSyBOvvhxMMj4yvqL+ngYdd568x4eEGVhKnIfRGNeAvvLGPKCGwxnXlp2sfTSSoGPOB
	s8feinc/uLOYIgo0Xyigi7mBUqI3Hil0=
X-Gm-Gg: Acq92OGEUHgNETp4048HpRAmBArYbohT9khegJO0GMoWKVfdM/8AVqcSdXq8xutN08H
	IkYnXfgEMeQsExLeUhEqAxscIoyAZKiSG9UvX7x+sxhnEy8mrq5Yli0XnLBxrRKPfTx3BcxbJJo
	V8iKL1eIl+WP7BYZPf80Ush7PXUhGauHh0EFED2YCkVil7aj0DgyCVmTTSMFE0DaK7sizOkMi8g
	dhOxsKHNj6hP4XMCn1xgg6B0g08AEIQNpdUDFg+bez1qHFgxT0ZvNB08pS4+jORA5RbRcqyHS4c
	OdczoDOLmIZ6Zkme
X-Received: by 2002:a17:907:2d29:b0:bd8:f776:6980 with SMTP id
 a640c23a62f3a-bdd25138390mr1297409366b.10.1779866128212; Wed, 27 May 2026
 00:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1779796354.git.zhoubinbin@loongson.cn> <6fd63cc57c112218ae0873b73d8c3a4b24304b80.1779796354.git.zhoubinbin@loongson.cn>
 <e45ea3e7-515e-45db-b969-cccdd3f432b5@sirena.org.uk>
In-Reply-To: <e45ea3e7-515e-45db-b969-cccdd3f432b5@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 27 May 2026 15:15:14 +0800
X-Gm-Features: AVHnY4JeCZyvZbusebCy_cAtVLuLbZpxOZ7qVDFa0k8SAH8AQmm88OJAlLvHVks
Message-ID: <CAMpQs4Kv_Yk5zpn-L+EbkDJwaJNJ0Mwhffo0VvcLU_tv2v9poQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] ASoC: loongson: Combined regmap definitions
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Wed, May 27, 2026 at 1:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, May 26, 2026 at 07:56:00PM +0800, Binbin Zhou wrote:
>
> > While moving, adjust the following:
> > - Mark only RX_DATA and TX_DATA as volatile registers. The PCI version
> >   incorrectly marked CFG/CTRL/CFG1 as volatile, which prevented proper
> >   regcache synchronization.
>
> The driver also polls LS_I2S_CTRL for MCLK_READY and CLK_READY, either
> we need to bypass the cache when doing that or that register needs to be
> volatile too.

Yes, the LS_I2S_CTRL should be volatile, otherwise, a timeout error may occ=
ur.

--=20
Thanks.
Binbin
