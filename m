Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2353B78C
	for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695223391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AodFqipq+4zzyepowhdy7gCv0Zx+sMPiLh2d6JJB00=;
	b=SHZIujf/yE/MrR4RJsz+dWvmwj9CCHhyURWcD3vCJAzjLEoq7sP+ld3aQXkky4xgezpq6L
	q8hw3mZUmRjmSV9RIjgzEx5qP64g09Phc1AAe57N7IHySkeWJP4FSwu8kJbIWYmTRb/Ojr
	GoDTtN1D9wEWvd2w7R/EBQ/tauskeE0=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-6yjZe6i6OxC-oLlf_O11aQ-1; Wed, 20 Sep 2023 11:23:09 -0400
X-MC-Unique: 6yjZe6i6OxC-oLlf_O11aQ-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-490393e9c4bso3109364e0c.0
        for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 08:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223389; x=1695828189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AodFqipq+4zzyepowhdy7gCv0Zx+sMPiLh2d6JJB00=;
        b=nGSsDz/7M9k1sDBw0E24v7WHXtkP4KYH5BJ2mJosrygBNVWVvsOkutZnCH4bEUQ3l1
         04EWFmw/vgwFDAAK1BDbclZmWfK7g68KB9nZYZ6B5wRyCtsMXTV5k7FSmgAeiTPzIUiL
         37/exZzRNql/mx+v4cj3hfapULDhInaWrF9hTXp9AIYR/3l5nA2WG2ZFXX4W/FCbAOTS
         ZgyzL+9NvYFzt0VHNhwCi3fOOzfSn/tq0PJhLSLFExZuWbnvxvxXm8S+ICQoDyPRqwS3
         KhE8vELH/m3mXW5JGhyHiaSHs0RvME4zGb3ptsjJdZBr4SDdBs/YUvhUKeqHcD1X2yBJ
         Q1dA==
X-Gm-Message-State: AOJu0YxbtdCrwrnESSuLBe4lnhgKecbCq4HFalCFsVsgNLjdn1NS5xJs
	exxSyFcBGAcOMqPfu5GHWvJ9dqCclrgDnbpbguu6zfEp+TtOainYIPMDsfVyJjQdsikOIf8sddQ
	/+ZOqBcVUHIbGsybyVLdtzBRCvln1pSO/GSF+
X-Received: by 2002:a1f:e043:0:b0:495:e530:5155 with SMTP id x64-20020a1fe043000000b00495e5305155mr3129260vkg.3.1695223389102;
        Wed, 20 Sep 2023 08:23:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvd/n8XEaJH7/YuJPXjPqPkp72tTLpM+DiKiB8tpdFg764ZKkrqCGUIqlRMG016VedD0OAjrNvfB9CJHZiKU8=
X-Received: by 2002:a1f:e043:0:b0:495:e530:5155 with SMTP id
 x64-20020a1fe043000000b00495e5305155mr3129240vkg.3.1695223388856; Wed, 20 Sep
 2023 08:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915014949.1222777-1-zhaotianrui@loongson.cn>
 <CAAhV-H5fbyoMk9XWsejU0zVg4jPq_t2PT3ODKiAnc1LNARpBzA@mail.gmail.com>
 <fed0bbb0-9c94-7dac-4956-f6c9b231fc0d@loongson.cn> <CAAhV-H5_KwmkEczws2diHpk5gDUZSAmy_7Zgi=CowhGZN9_d_A@mail.gmail.com>
 <e53a4428-7533-61cd-81c5-0a65877041fd@loongson.cn> <CAAhV-H7QKBEV_dSfX8nprZ838HRCcDt8cziPip4UdSMuYvERzQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7QKBEV_dSfX8nprZ838HRCcDt8cziPip4UdSMuYvERzQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 20 Sep 2023 17:22:57 +0200
Message-ID: <CABgObfaWiNYWFhR5528=3_1RBqTwTDqNpBHDRbvkd-9UyrCDpg@mail.gmail.com>
Subject: Re: [PATCH v21 00/29] Add KVM LoongArch support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: zhaotianrui <zhaotianrui@loongson.cn>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 5:17=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
> I can test now, during my tests I may ask some other questions about
> your patches. You just need to answer my questions and I will adjust
> the code myself if needed. After that I will give you a final version
> with Tested-by and you can simply send that as V22.

Since you are preparing yourself the v22, you could also send it to me
as a pull request.

Thanks,

Paolo

