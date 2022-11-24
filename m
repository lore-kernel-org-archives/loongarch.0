Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96BB23AE
	for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 09:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818BCC433D6
	for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669283708;
	bh=5kaoiogge2CYIRkqs7Z6Uu8+iginiulfFRFqfLUtw0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oji2yPLYW7Lu/Or6kTo49asVjl4SI3j0UlBjpUg3bqJCUkx1Z+scI4jdQLep66Rhj
	 M3eLxaMpJKjcH+Vbo3/0AsB9W08VyKnaLeG2ksn4CLFXw7BRAwf++qjuxdMHii2wT3
	 HU/PjU5+XDUCuB0gn6g/FMJhVojIbRg4oHr/Fy85jrvwVuacWyaz1kX1j1L9K9xqiq
	 AVtXSUCT2APz2ZMCltBOeUd0Utn3w5PIFCbqrCahQ4gFWydgwfPyzADXrFfxvU9sPb
	 K0220O8TRH0s+Qi/mVNoGoRvCHDItM1i7Lhum09nIY8+WPiUMpFvRvGAhezzH0OTSZ
	 Ct/TK5axZChYQ==
Received: by mail-ed1-f53.google.com with SMTP id e13so1827950edj.7
        for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 01:55:08 -0800 (PST)
X-Gm-Message-State: ANoB5plRdcHGvFmY0dbJhyiBNcaefz77aufea++hO1CspWuZJGoDg+Oj
	FtyNkYM6rus1VzRuEBHRp68FCD7G8fdowBHEpU0=
X-Google-Smtp-Source: AA0mqf6uCf7DOW+G4EorXIvJeHLYegfrRCikQfgD6PTITzF4WYxsHRL/hxCaLiQi8oHYLJbosvZBptwkLJT2qgHdxlk=
X-Received: by 2002:a05:6402:10d1:b0:467:7508:89ca with SMTP id
 p17-20020a05640210d100b00467750889camr14616991edu.284.1669283706749; Thu, 24
 Nov 2022 01:55:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1669123257-18550-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1669123257-18550-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 24 Nov 2022 17:54:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5=BB3=AJ9K=u_6pqxAz9Orr0zBFM7nOafEtkL-PjttUw@mail.gmail.com>
Message-ID: <CAAhV-H5=BB3=AJ9K=u_6pqxAz9Orr0zBFM7nOafEtkL-PjttUw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN/LoongArch: Fix wrong description of FPRs Note
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QXBwbGllZCB0byBsb29uZ2FyY2gtZml4ZXMsIHRoYW5rcy4NCg0KT24gVHVlLCBOb3YgMjIsIDIw
MjIgYXQgOToyMSBQTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj4gd3JvdGU6
DQo+DQo+IFRoZSBDaGluZXNlIHRyYW5zbGF0aW9uIG9mIEZQUnMgTm90ZSBpcyBub3QgY29uc2lz
dGVudCB3aXRoIHRoZSBvcmlnaW5hbA0KPiBFbmdsaXNoIHZlcnNpb24sICR2MC8kdjEgc2hvdWxk
IGJlICRmdjAvJGZ2MSwgJGEwLyRhMSBzaG91bGQgYmUgJGZhMC8kZmExLA0KPiBmaXggdGhlbS4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+
DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbG9vbmdhcmNoL2lu
dHJvZHVjdGlvbi5yc3QgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9sb29uZ2FyY2gvaW50cm9kdWN0aW9uLnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0DQo+IGluZGV4IDEy
ODg3OGYuLmYzZWMyNWIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0DQo+IEBAIC03MCw4
ICs3MCw4IEBAIExBNjTkuK3mr4/kuKrlr4TlrZjlmajkuLo2NOS9jeWuveOAgiBgYCRyMGBgIOea
hOWGheWuueaAu+aYr+WbuuWumuS4ujDvvIzogIzlhbYNCj4gID09PT09PT09PT09PT09PT09ID09
PT09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09ID09PT09PT09PT0NCj4NCj4gIC4u
IG5vdGU6Og0KPiAtICAgIOazqOaEj++8muWcqOS4gOS6m+mBl+eVmeS7o+eggeS4reacieaXtuWP
r+iDveingeWIsCBgYCR2MGBgIOWSjCBgYCR2MWBgIO+8jOWug+S7rOaYrw0KPiAtICAgIGBgJGEw
YGAg5ZKMIGBgJGExYGAg55qE5Yir5ZCN77yM5bGe5LqO5bey57uP5bqf5byD55qE55So5rOV44CC
DQo+ICsgICAg5rOo5oSP77ya5Zyo5LiA5Lqb6YGX55WZ5Luj56CB5Lit5pyJ5pe25Y+v6IO96KeB
5YiwIGBgJGZ2MGBgIOWSjCBgYCRmdjFgYCDvvIzlroPku6zmmK8NCj4gKyAgICBgYCRmYTBgYCDl
kowgYGAkZmExYGAg55qE5Yir5ZCN77yM5bGe5LqO5bey57uP5bqf5byD55qE55So5rOV44CCDQo+
DQo+DQo+ICDlkJHph4/lr4TlrZjlmagNCj4gLS0NCj4gMi4xLjANCj4NCg==
