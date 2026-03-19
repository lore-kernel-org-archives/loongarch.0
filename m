Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6739C003
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903938; cv=none; b=B1GZuPLy3R/3CGU8+jayT7IBgF+KoOKl4E/MKBEFVn7K0DU5O2UbPbJR+rtFaSfORHGs+6RYXdEETx07r0leElVbNwBFw2ean1YqXfzIE/wVqXkb234Ln0cA0JqcnXF75T+nqNtxf3LHn+wO9xA7Ku8Cy7kbyYads+UY9xPdhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903938; c=relaxed/simple;
	bh=wByaUL24vrAyIuOx18rXl10HJ+lmVFi8kPhiaZgqoCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mguPG5BfsPgbg414y5pUya9GiThTd4d2cZ5m92LmuG8iYlbOZZipedh9anJK9m/AHtkR5DbWAxeXmQ1tdxBre4fp2B11BQt3pyMq7O/5Hcjsd0HNKmKab6lbrHI5mVpBOt1EOqnSwNEj8B8GEKfRxffD+ntXZ+5mb2RbdFIaVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AhS8yK6Z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AhS8yK6Z"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso1003457a12.0
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773903935; x=1774508735; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wByaUL24vrAyIuOx18rXl10HJ+lmVFi8kPhiaZgqoCk=;
        b=AhS8yK6ZOw6+I8pNoXul9S237N3Zlxr4jyDyCySM62tkK1SlKQs0p1atJqrhP0guyQ
         2hikCDO5iSg4Hj6eoGd2Ucu3AdqpXfUJOylRDtFEgN7/MMOzSPZXH74OnoYUyn93luAx
         WXMJ73OiVO1nP6OV+qWS+95cC8RVqGFRaNLPJ3OhV4KERgTe0Ronj4qqetzRul1Dw/tM
         18u7J17b/tLAAvTDDDVNrnL+oIqTIWi2Dj8XS7eJNjlkj9lxird1ShC334rCBIqVWgyb
         7rxfv4qG+CCkVL64UCthrsNnmfIebSWT5Ipu55GGW9v+ygFGS67SlE+m4OlxqeBQe0Z4
         lJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773903935; x=1774508735;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wByaUL24vrAyIuOx18rXl10HJ+lmVFi8kPhiaZgqoCk=;
        b=m0jZFLj0BtTNHoR5lYQTf3UdHr4rb0xSl7Obgf97ViUnBNMRe4Eeb0zMo8YvXi46qu
         lqtfgpYZxN9H403e5eUuj7g2TX1+Ddl2zlYVO1ncmm1ZKNAD4wcIo3IHJp3OmJ3is/4K
         YIYYIssQ/TjE9PlmBG4vUUDPoWM0i7Rtqwgt5SCo3SRhnPs1HY5j3yRNhDah7HohEZEG
         2H9myNPK8kgbS6AGte41DlQpsSsgwVEVde66GfKncDf+3CUepJ7bJ/3HZH8eHIkng8tU
         /44WTOUBqxXmQQYopTGxfu56g6nxV41XjMCQ1HSDsY/3Y1uzVNkcvDBqEx5LXLqOMrou
         KB4A==
X-Forwarded-Encrypted: i=1; AJvYcCVBwuDJOLQuNPVzo31cZf24S1Ius4GXjcJLRteXRF1JO9909u6B+Ab9hlqSW5nfE3fXXL/qd5oGevU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEqCp3Mm7F17exMp2ugRQG9Jcm/2Tl7eKDSD2IzZ3z+BI4Py9a
	u+2nSF9lKixrrorauVur48Zjy7cfQR3vQDVrTW9Km5z/tr1z4htDfjZcT8Fb/DALkPo=
X-Gm-Gg: ATEYQzyii2VuW63mmfEfYp+t6+1vcXJampn5RrgZjKiEMllv2dYTgmZDzuGY384hvER
	Bz0LVBrkUWdX0GUvO3/yTOU2q+Xx+TufjSzV1H99B3+nYgyAG5X/IxqhVe6wRcP3KAirhu3WQ83
	wNiUiIX6t6P6AclrXYuKlNJnZZBZX4KXsD5KPbOOg/SLAMKrO6Kfvs86CcFxjbCMROJe2ZzAPqJ
	4795KGFUylfU3np//yC8JM0V6B6u4cc2zcZvSUkfbrr1XxLh2/I/cs6WU7rSi5Tono8qYQ+w4kX
	H/7Qj6xVLtEUf/CWNbrurkLdpeWz/OkE4cgMZMuHYkcXQpy430HepZw+M4ESo2eQ+497qnAUxJg
	EmDEOmvBOEaT5AnGlucbX9YvTGPCB4jjxgTiHJ5EtlevsWjG6EqJncfh4xIIuBBY0mFX/T59wRj
	JW5LWwk53C5cIqJq7ApHbIJwUcLVq7eRHEx85c7p4E5xsq1aLZb+7Nx5RDmwrD3tD3PdRmbv0+s
	unK70fSK0uHzoliRhwCO78r8Np7NK7gIuhaWRickuyvX1E3fRm4XA==
X-Received: by 2002:a05:6402:458a:b0:668:58b6:5061 with SMTP id 4fb4d7f45d1cf-66858b651e5mr869453a12.23.1773903934927;
        Thu, 19 Mar 2026 00:05:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b14976f1sm3306167a12.31.2026.03.19.00.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:05:34 -0700 (PDT)
Message-ID: <5f0ca1fc-9eb4-48ae-b578-f490a6ba5ea3@suse.com>
Date: Thu, 19 Mar 2026 08:05:33 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] x86/acpi: Add acpi_get_cpu_uid() implementation
 and update Xen users
To: Chengwen Feng <fengchengwen@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>,
 Kai Huang <kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Huth <thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>,
 Kevin Loughlin <kevinloughlin@google.com>, Zheyun Shen
 <szy0127@sjtu.edu.cn>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>,
 "Ahmed S . Darwish" <darwi@linutronix.de>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Robin Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>,
 Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
 Wei Huang <wei.huang2@amd.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>, punit.agrawal@oss.qualcomm.com,
 guohanjun@huawei.com, suzuki.poulose@arm.com, ryan.roberts@arm.com,
 chenl311@chinatelecom.cn, masahiroy@kernel.org,
 wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com,
 heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com,
 wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, liuyonglong@huawei.com,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, stable@vger.kernel.org
References: <20260319065735.45954-1-fengchengwen@huawei.com>
 <20260319065735.45954-5-fengchengwen@huawei.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20260319065735.45954-5-fengchengwen@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3tp0T0MlZQxaVhr4dI0c0IO4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3tp0T0MlZQxaVhr4dI0c0IO4
Content-Type: multipart/mixed; boundary="------------T7ItBqu2YKFGEfwY3NGBxjdV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Chengwen Feng <fengchengwen@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>,
 Kai Huang <kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Huth <thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>,
 Kevin Loughlin <kevinloughlin@google.com>, Zheyun Shen
 <szy0127@sjtu.edu.cn>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>,
 "Ahmed S . Darwish" <darwi@linutronix.de>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Robin Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>,
 Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
 Wei Huang <wei.huang2@amd.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>, punit.agrawal@oss.qualcomm.com,
 guohanjun@huawei.com, suzuki.poulose@arm.com, ryan.roberts@arm.com,
 chenl311@chinatelecom.cn, masahiroy@kernel.org,
 wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com,
 heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com,
 wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, liuyonglong@huawei.com,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, stable@vger.kernel.org
Message-ID: <5f0ca1fc-9eb4-48ae-b578-f490a6ba5ea3@suse.com>
Subject: Re: [PATCH v9 4/7] x86/acpi: Add acpi_get_cpu_uid() implementation
 and update Xen users
References: <20260319065735.45954-1-fengchengwen@huawei.com>
 <20260319065735.45954-5-fengchengwen@huawei.com>
In-Reply-To: <20260319065735.45954-5-fengchengwen@huawei.com>

--------------T7ItBqu2YKFGEfwY3NGBxjdV
Content-Type: multipart/mixed; boundary="------------dgRJU17tRiil2XqvArK0zE1P"

--------------dgRJU17tRiil2XqvArK0zE1P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMDc6NTcsIENoZW5nd2VuIEZlbmcgd3JvdGU6DQo+IEFkZCBhcmNoLXNw
ZWNpZmljIGFjcGlfZ2V0X2NwdV91aWQoKSBmb3IgeDg2Og0KPiAtIERlY2xhcmUgYWNwaV9n
ZXRfY3B1X3VpZCgpIGluIGFyY2gveDg2L2luY2x1ZGUvYXNtL2FjcGkuaA0KPiAtIEltcGxl
bWVudCBhY3BpX2dldF9jcHVfdWlkKCkgd2l0aCBpbnB1dCBwYXJhbWV0ZXIgdmFsaWRhdGlv
bg0KPiAtIFJlcGxhY2UgY3B1X2FjcGlfaWQoKSB3aXRoIGFjcGlfZ2V0X2NwdV91aWQoKSBp
biBYZW4tcmVsYXRlZCBjb2RlDQo+IC0gUmVtb3ZlIHRoZSBub3ctdW51c2VkIGNwdV9hY3Bp
X2lkKCkgZnVuY3Rpb24NCj4gDQo+IEV4dGVuZCB0aGUgdW5pZmllZCBBQ1BJIENQVSBVSUQg
aW50ZXJmYWNlIHRvIHg4NiwgZW5zdXJpbmcgY29uc2lzdGVudA0KPiBlcnJvciBoYW5kbGlu
ZyBhbmQgaW5wdXQgdmFsaWRhdGlvbiBhY3Jvc3MgYWxsIEFDUEktZW5hYmxlZA0KPiBhcmNo
aXRlY3R1cmVzLg0KPiANCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVk
LW9mZi1ieTogQ2hlbmd3ZW4gRmVuZyA8ZmVuZ2NoZW5nd2VuQGh1YXdlaS5jb20+DQo+IFJl
dmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5j
b20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------dgRJU17tRiil2XqvArK0zE1P
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dgRJU17tRiil2XqvArK0zE1P--

--------------T7ItBqu2YKFGEfwY3NGBxjdV--

--------------3tp0T0MlZQxaVhr4dI0c0IO4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm7oD0FAwAAAAAACgkQsN6d1ii/Ey+T
4Af7BgRCEqltwxse9iwcB9WhOIH6KFt1MYOFZq112r1cJg+TH/WEse7TN58VY5qa+q1hJREPnezC
LCVT3XE6GrfGVi/BneCT3fapyoRpJo8WUFwvtqIj+QHgdvgl1ic3A6m/3x9PkqZwsbbueYZD9m57
EZQ6a1JXiStwakpyRJTmIi5kL4NFQJWMIgznjeOmWCYpg9vhkpfWZ/x7Tr+tb0OdX+DuqRw+ken9
0FrgxNuxF96ZiXq2q5PB2ntXKoNpSS2n+NIqcn2dsIAb8ICVS1sZHNu5TtbcKPMCz02KbrLaCYa/
WkP0G6aIrA3XQwzQDZddXKuFcNeZqR9TXz4FC71G4Q==
=cF9V
-----END PGP SIGNATURE-----

--------------3tp0T0MlZQxaVhr4dI0c0IO4--
